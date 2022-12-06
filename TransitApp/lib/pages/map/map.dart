import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/map/stops/stop_buses.dart';
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
import 'stops/stop.dart';
import 'constants.dart';
import 'stops/stop_buses.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController mapController;
  var _myLocation;
  double _zoom = 17;
  Offset? tapXY;
  var overlay;
  List<Stop> mapMarkers = [];
  String input = '';

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _getCurrentPosition();
    _loadData();
    setState(() {});
  }

  Future _loadData() async {
    var response = await http.get(Uri.parse(
        'https://maps.durham.ca/arcgis/rest/services/Open_Data/Durham_OpenData/MapServer/19/query?outFields=*&where=1%3D1&f=geojson'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      for (int i = 0; i < data['features'].length; i++) {
        Stop stop = Stop(
            "${data['features'][i]['properties']['ABBREVIATI']}:1",
            data['features'][i]['properties']['NAME'],
            LatLng(data['features'][i]['geometry']['coordinates'][1],
                data['features'][i]['geometry']['coordinates'][0]));
        mapMarkers.add(stop);
      }
      setState(() {});
    }

    response = await http.get(Uri.parse(
        'https://maps.durham.ca/arcgis/rest/services/Open_Data/Durham_OpenData/MapServer/19/query?outFields=*&where=1%3D1&resultOffset=1000&f=geojson'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      for (int i = 0; i < data['features'].length; i++) {
        Stop stop = Stop(
            "${data['features'][i]['properties']['ABBREVIATI']}:1",
            data['features'][i]['properties']['NAME'],
            LatLng(data['features'][i]['geometry']['coordinates'][1],
                data['features'][i]['geometry']['coordinates'][0]));
        mapMarkers.add(stop);
      }
      setState(() {});
    }
    response = await http.get(Uri.parse(
        'https://maps.durham.ca/arcgis/rest/services/Open_Data/Durham_OpenData/MapServer/19/query?outFields=*&where=1%3D1&resultOffset=1999&f=geojson'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      for (int i = 0; i < data['features'].length - 1; i++) {
        Stop stop = Stop(
            "${data['features'][i]['properties']['ABBREVIATI']}:1",
            data['features'][i]['properties']['NAME'],
            LatLng(data['features'][i]['geometry']['coordinates'][1],
                data['features'][i]['geometry']['coordinates'][0]));
        mapMarkers.add(stop);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context)?.context.findRenderObject();

    if (_myLocation.runtimeType.toString() == "Null") {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SlidingUpPanel(
      minHeight: 175,
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
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: TextEditingController(text: input),
                        onChanged: (value) => input = value,
                        onSaved: (newValue) => print('saved'),
                        decoration: TextInput.textInputDecoration(
                          label: 'Search',
                          placeholder: 'Enter address or location',
                          iconData: CupertinoIcons.search,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DRTElevatedButton(
                          text: 'Search',
                          onPressed: () async {
                            if (input.trim().isEmpty) return;
                            final List<Location> locations =
                                await locationFromAddress(input);
                            setState(() {
                              mapController.move(
                                  LatLng(locations[0].latitude,
                                      locations[0].longitude),
                                  _zoom);
                            });
                          })
                    ],
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
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                        height: 60,
                        width: 60,
                        point: mapMarkers[i].location!,
                        builder: (context) {
                          return GestureDetector(
                            onTapDown: getPosition,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: drtGreen,
                              child: IconButton(
                                onPressed: () {
                                  showMenu(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    elevation: 8.0,
                                    color: drtGreen,
                                    position: RelativeRect.fromSize(
                                        tapXY! & const Size(40, 40),
                                        overlay.size),
                                    items: [
                                      PopupMenuItem(
                                        height: 24,
                                        value: mapMarkers[i].stop_id,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StopBuses(
                                                          stop_id: mapMarkers[i]
                                                              .stop_id)),
                                            );
                                          },
                                          child: Center(
                                            child: Text(
                                              mapMarkers[i].stop_name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                icon: Icon(
                                  Icons.tram,
                                  color: ibmGreen['10'],
                                  size: 35,
                                ),
                              ),
                            ),
                          );
                        }),
                ],
              ),
            ]),
      ]),
    );
  }

  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
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
      debugPrint(e.toString());
    });
    setState(() {});
  }

  _getLocationFromLatLong(LatLng location) async {
    final List<Placemark> places =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    return places[0];
  }
}
