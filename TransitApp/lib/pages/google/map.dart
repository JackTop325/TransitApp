import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  static const initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(),
    );
  }
}
