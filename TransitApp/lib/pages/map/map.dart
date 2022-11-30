import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/text_input.dart';
import 'build_map.dart';
import 'stops/stop_detail_widget.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'constants.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController mapController;
  var _myLocation;
  double _zoom = 17;
  var mapMarkers = [];
  List<LatLng> mapPoints = [];

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    setState(() {
      _getCurrentPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 250.0,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      panel: Container(
        color: ibmGray['10'],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Container(
                    height: 3.0,
                    width: 30.0,
                    color: ibmGray['80'],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              //const TextInput(
              //  label: 'Starting Point',
              //  placeholder: 'Enter address',
              //),
              //const SizedBox(height: 16.0),
              //const TextInput(
              //  label: 'Destination',
              //  placeholder: 'Enter address',
              //),
              //const SizedBox(height: 16.0),
              //DRTElevatedButton(
              //  text: 'Search',
              //  onPressed: () {},
              //),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CupertinoSearchTextField(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onSubmitted: (String address) async {
                      final List<Location> locations =
                      await locationFromAddress(address);
                      setState(() {
                        mapController.move(
                            LatLng(locations[0].latitude, locations[0].longitude),
                            _zoom);
                      });
                    },
                  )),
            ],
          ),
        ),
      ),
      body: Stack(children: [
        FlutterMap(
            mapController: mapController,
            options: MapOptions(zoom: _zoom, center: _myLocation),
            layers: [
              TileLayerOptions(
                urlTemplate: AppConstants.mapBoxStyleId,
              ),
              MarkerLayerOptions(
                markers: [
                  for (int i = 0; i < mapPoints.length; i++)
                    Marker(
                        height: 80,
                        width: 80,
                        point: mapPoints[i],
                        builder: (context) {
                          return Container(
                              child: const Icon(
                                Icons.location_on,
                                size: 35,
                                color: Colors.blue,
                              ));
                        }),
                ],
              ),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: mapPoints,
                    strokeWidth: 2.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ]),
      ]),
    );
  }


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _myLocation = LatLng(position.latitude, position.longitude);
        mapController.move(_myLocation, _zoom);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  _getLocationFromLatLong(LatLng location) async {
    final List<Placemark> places =
    await placemarkFromCoordinates(location.latitude, location.longitude);
    return places[0];
  }
}
