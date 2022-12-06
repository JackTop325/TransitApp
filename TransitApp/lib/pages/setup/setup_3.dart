import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transit_app/local_storage/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';

class SetupPageThree extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String group;
  const SetupPageThree({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.group,
  });

  @override
  State<SetupPageThree> createState() => _SetupPageThreeState();
}

class _SetupPageThreeState extends State<SetupPageThree> {
  File? image;

  Future pickImage() async {
    try {
      ImagePicker imagePicker = ImagePicker();
      final profile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (profile == null) return;
      final temp = File(profile.path);
      setState(() {
        image = temp;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to pick image');
      // ignore: avoid_print
      print(e.toString());
    }
  }

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
                const SizedBox(
                  height: 32.0,
                ),
                const SizedBox(height: 32.0),
                SvgPicture.asset(
                  'assets/logo.svg',
                  color: ibmGreen['80'],
                  height: 100.0,
                ),
                const SizedBox(height: 64.0),
                const Text(
                  'Pick a profile image:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 72.0),
                CircleAvatar(
                  // minRadius: 150.0,
                  // maxRadius: 155.0,
                  radius: 125,
                  child: image == null
                      ? ClipOval(
                          child: Image.asset(
                          'assets/anonymous.jpg',
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ))
                      : ClipOval(
                          child: Image.file(
                            image!,
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                image != null
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            image = null;
                          });
                        },
                        child: const Text(
                          "Remove",
                          style: TextStyle(
                            color: ibmAlertRed,
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () => pickImage(),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: drtGreen,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                const SizedBox(height: 24.0),
                DRTElevatedButton(
                  text: 'Continue',
                  iconData: CupertinoIcons.arrow_right_circle_fill,
                  iconColor: ibmGreen['10'],
                  onPressed: () async {
                    String base64Image = '';
                    if (image != null) {
                      List<int> imageBytes = image!.readAsBytesSync();
                      base64Image = base64Encode(imageBytes);
                    }

                    Profile.write(jsonEncode({
                      'initialized': true,
                      'firstName': widget.firstName,
                      'lastName': widget.lastName,
                      'group': widget.group,
                      'lang': 'en',
                      'avatar': base64Image,
                    }));

                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                const SizedBox(height: 18.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
