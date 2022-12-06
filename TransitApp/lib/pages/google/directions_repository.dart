import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/.env.dart';

class DirectionsRepository {
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Dio dio;

  DirectionsRepository({required this.dio});

  int googleTime(TimeOfDay timeOfDay) {
    DateTime first = DateTime(1970, 1, 1);
    DateTime today = DateTime.now();
    DateTime date = DateTime(
        today.year, today.month, today.day, timeOfDay.hour, timeOfDay.minute);
    return date.difference(first).inSeconds + 18000;
  }

  Future getDirections({
    required String origin,
    required String destination,
    required TimeOfDay timeOfDay,
    required bool isDeparting,
  }) async {
    final response = await dio.get(
      baseUrl,
      queryParameters: {
        'origin': origin,
        'destination': destination,
        'mode': 'transit',
        'travel_mode': "bus",
        isDeparting ? 'departure_time' : 'arrival_time': googleTime(timeOfDay),
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
