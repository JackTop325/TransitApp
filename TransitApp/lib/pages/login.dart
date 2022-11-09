import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  isPassword: true,
                ),
                const SizedBox(height: 20.0),
                DRTElevatedButton(
                  text: 'Login',
                  iconData: CupertinoIcons.arrow_right_circle_fill,
                  iconColor: ibmGreen10,
                  onPressed: () {},
                ),
                const SizedBox(height: 12.0),
                DRTElevatedButton(
                  text: 'Register',
                  backgroundColor: Colors.black,
                  iconData: CupertinoIcons.person_crop_circle_badge_plus,
                  onPressed: () {},
                ),
                const SizedBox(height: 12.0),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
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
