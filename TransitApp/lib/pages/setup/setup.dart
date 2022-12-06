import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/privacy_policy.dart';
import 'package:transit_app/pages/setup/setup_1.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 96.0),
                Center(
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    color: ibmGreen['80'],
                    height: 100.0,
                  ),
                ),
                const SizedBox(height: 32.0),
                Image.asset('assets/city_bus.png'),
                const SizedBox(height: 24.0),
                const Text(
                  "Let's get started!",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "To best suit your needs, we are going to ask a couple of"
                    " questions. For concerns about privacy, please read our"
                    " privacy policy below.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: ibmGray['70'],
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                DRTElevatedButton(
                  text: 'Get started',
                  iconData: CupertinoIcons.arrow_right_circle_fill,
                  iconColor: ibmGreen['10'],
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetupPageOne())),
                ),
                // const SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => PrivacyPolicy()));
                  },
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: ibmGreen['60'],
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
