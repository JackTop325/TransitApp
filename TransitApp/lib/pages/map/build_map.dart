import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'constants.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BuildMap extends StatefulWidget {
  const BuildMap({Key? key}) : super(key: key);

  @override
  State<BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<BuildMap> {
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
    //_loadData();
  }

  Future _loadData() async {
    var response =
    await http.get(Uri.parse(
        'https://maps.durham.ca/arcgis/rest/services/Open_Data/Durham_OpenData/MapServer/19/query?outFields=*&where=1%3D1&f=geojson'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = new Map<String, dynamic>.from(
          json.decode(response.body));
      print(data['features'][1]);
      print(data['features'][1]['geometry']['coordinates'][0]);
      print(data['features'][1]['geometry']['coordinates'][1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
    ]);
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
/*
  _addMarker(LatLng loc) async {
    var location = await _getLocationFromLatLong(loc);
    mapMarkers.add(MapMarker(
        name: location.name,
        address: location.street,
        location: mapController.center));
    mapPoints.add(loc);
    setState(() {});
  }
*/
}
