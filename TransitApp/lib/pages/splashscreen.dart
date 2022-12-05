import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, '/setup');
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
