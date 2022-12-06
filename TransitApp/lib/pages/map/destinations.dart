import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_app/colors.dart';

class Destination {
  String location;
  String address;
  IconData iconData;
  Color bgColor;
  Color iconColor;
  LatLng latlng;

  Destination({
    required this.location,
    required this.address,
    required this.iconData,
    this.bgColor = drtGreen,
    this.iconColor = Colors.white,
    required this.latlng,
  });

  @override
  String toString() {
    return 'Destination[location: $location]';
  }
}

List destinations = [
  Destination(
    location: 'Ontario Tech University',
    address: '2000 Simcoe St. N, Oshawa',
    iconData: Icons.school,
    bgColor: ibmBlue['60'] as Color,
    latlng: LatLng(43.9456, -78.8968),
  ),
  Destination(
    location: 'Pickering Museum Village',
    address: '2365 Concession Rd 6, Pickering',
    iconData: Icons.museum,
    bgColor: ibmRed['60'] as Color,
    latlng: LatLng(43.924815, -79.07164),
  ),
  Destination(
    location: 'Treetop Eco-Adventure Park',
    address: ' 53 Snow Ridge Ct, Oshawa',
    iconData: CupertinoIcons.tree,
    bgColor: ibmGreen['60'] as Color,
    latlng: LatLng(44.026760, -78.928920),
  ),
  Destination(
    location: 'Canadian Automotive Museum',
    address: '99 Simcoe St S, Oshawa',
    iconData: CupertinoIcons.car,
    bgColor: ibmMagenta['60'] as Color,
    latlng: LatLng(43.894940, -78.862200),
  ),
];
