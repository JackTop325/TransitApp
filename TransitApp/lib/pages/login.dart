import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/text_input.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    color: ibmGreen80,
                  ),
                ),
                const SizedBox(height: 50.0),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const TextInput(
                  label: 'Username',
                ),
                const SizedBox(height: 20.0),
                const TextInput(
                  label: 'Password',
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    backgroundColor: ibmGreen60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 20.0),
                      const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: ibmGreen10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Icon(
                        CupertinoIcons.person_crop_circle_badge_plus,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue without account",
                        style: TextStyle(color: ibmGreen60),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
