import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';

class SettingsAboutDialog extends StatefulWidget {
  const SettingsAboutDialog({super.key});

  @override
  State<SettingsAboutDialog> createState() => _SettingsAboutDialogState();
}

class _SettingsAboutDialogState extends State<SettingsAboutDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 450.0,
        margin: const EdgeInsets.only(top: 45.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/city_life.webp'),
            SvgPicture.asset(
              'assets/logo.svg',
              color: drtGreen,
            ),
            const SizedBox(height: 32.0),
            const Text(
              "Brought to you by",
              style: TextStyle(
                color: drtGray,
                fontSize: 15.0,
              ),
            ),
            const Text(
              "Andrew, Drake, Jackie & Kyle",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
