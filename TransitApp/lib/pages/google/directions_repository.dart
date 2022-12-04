import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transit_app/.env.dart';

class DirectionsRepository {
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Dio dio;

  DirectionsRepository({required this.dio});

  getDirections({
    required String origin,
    required String destination,
  }) async {
    final response = await dio.get(
      baseUrl,
      queryParameters: {
        // 'origin': '${origin.latitude},${origin.longitude}',
        // 'destination': '${destination.latitude},${destination.longitude}',
        'origin': origin,
        'destination': destination,
        'mode': 'transit',
        'travel_mode': "bus",
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      if (response.data['routes'].length != 0) {
        print('#######################################');
        print(response.data['routes'][0]['legs'][0]['arrival_time']['text']);
        print(response.data['routes'][0]['legs'][0]['departure_time']['text']);
        print(response.data['routes'][0]['legs'][0]['distance']['text']);
        print(response.data['routes'][0]['legs'][0]['duration']['text']);
        var steps = response.data['routes'][0]['legs'][0]['steps'];
        for (var step in steps) {
          print('${step['html_instructions']} ${step['distance']['text']}');
        }
        print(steps.length);
        // print(
        //     response.data['routes'][0]['legs']['duration']['text'].toString());
      }
      return response.data;
      // return Directions.fromMap(response.data);
    }
    return null;
  }
}
