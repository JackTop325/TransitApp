import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:transit_app/.env.dart';

class DirectionsRepository {
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Dio dio;

  DirectionsRepository({required this.dio});

  Future getDirections({
    required String origin,
    required String destination,
  }) async {
    final response = await dio.get(
      baseUrl,
      queryParameters: {
        'origin': origin,
        'destination': destination,
        'mode': 'transit',
        'travel_mode': "bus",
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }
}
