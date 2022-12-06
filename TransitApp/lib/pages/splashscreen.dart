import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/profile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      String res = await Profile.read();
      dynamic profile = jsonDecode(res);
      if (profile['init'] == false) {
        // ignore: avoid_print
        print('Profile created');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/setup');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      }
    });

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                color: Colors.black,
                semanticsLabel: 'Durham Region Transit logo',
              ),
              const SizedBox(
                height: 30.0,
              ),
              const CircularProgressIndicator(
                color: drtGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
