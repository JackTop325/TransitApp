import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/pages/setup/setup.dart';
import 'package:transit_app/pages/setup/setup_2.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/drt_snackbar.dart';
import 'package:transit_app/widgets/text_input.dart';

class SetupPageOne extends StatefulWidget {
  const SetupPageOne({super.key});

  @override
  State<SetupPageOne> createState() => _SetupPageOneState();
}

class _SetupPageOneState extends State<SetupPageOne> {
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetupPage()));
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    color: drtGreen,
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    color: ibmGreen['80'],
                    height: 100.0,
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: Image.asset(
                    'assets/group.png',
                  ),
                ),
                const SizedBox(height: 64.0),
                const Text(
                  'Please enter the following details:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: TextEditingController(text: firstName),
                  onChanged: (value) => firstName = value,
                  decoration: TextInput.textInputDecoration(
                    label: 'First name',
                    placeholder: 'Enter your first name',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: TextEditingController(text: lastName),
                  onChanged: (value) => lastName = value,
                  decoration: TextInput.textInputDecoration(
                    label: 'Last name',
                    placeholder: 'Enter your last name',
                  ),
                ),
                const SizedBox(height: 20.0),
                DRTElevatedButton(
                    text: 'Continue',
                    iconData: CupertinoIcons.arrow_right_circle_fill,
                    iconColor: ibmGreen['10'],
                    onPressed: () {
                      if (firstName.trim() == '' || lastName.trim() == '') {
                        DRTSnackBar.display(
                            context, 'Please fill out all fields.',
                            backgroundColor: ibmAlertRed);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetupPageTwo(
                                firstName: firstName,
                                lastName: lastName,
                              ),
                            ));
                      }
                    }),
                const SizedBox(height: 18.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
