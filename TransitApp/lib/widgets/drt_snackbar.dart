import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class DRTSnackBar {
  static void display(BuildContext context, String text,
      {int duration = 1500}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Satoshi',
        ),
      ),
      backgroundColor: drtGreen,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      elevation: 30,
      duration: Duration(milliseconds: duration),
    ));
  }
}
