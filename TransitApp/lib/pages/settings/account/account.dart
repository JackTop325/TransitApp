import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/profile.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/drt_snackbar.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/widgets/text_input.dart';

class AccountPage extends StatefulWidget {
  dynamic profile;
  AccountPage({super.key, required this.profile});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String firstName = '';
  String lastName = '';
  String group = 'Adult';
  String image = '';

  @override
  List<String> groups = ['Kid', 'Youth', 'Adult', 'Senior'];

  void initState() {
    super.initState();
    firstName = widget.profile['firstName'];
    lastName = widget.profile['lastName'];
    group = widget.profile['group'];
    image = widget.profile['avatar'];
  }

  Future pickImage() async {
    try {
      ImagePicker imagePicker = ImagePicker();
      final profile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (profile == null) return;
      final temp = File(profile.path);
      String base64Image = '';
      if (temp != null) {
        List<int> imageBytes = temp.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
      }
      setState(() {
        image = base64Image;
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
        child: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
          color: ibmGray['10'],
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        color: drtGreen,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const ScreenTitle(title: 'Account'),
                  ],
                ),
                SizedBox(height: 32),
                CircleAvatar(
                  // minRadius: 150.0,
                  // maxRadius: 155.0,
                  radius: 125,
                  child: image == ''
                      ? ClipOval(
                          child: Image.asset(
                          'assets/anonymous.jpg',
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ))
                      : ClipOval(
                          child: Image.memory(
                            base64Decode(image),
                            height: 250,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                image != ''
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            image = '';
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
                        // onPressed: () => print('wat'),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: drtGreen,
                            fontSize: 16.0,
                          ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Group',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    DropdownButton(
                      value: group,
                      items:
                          groups.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          group = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                DRTElevatedButton(
                    text: 'Update',
                    onPressed: () async {
                      if (firstName.trim() == '' || lastName.trim() == '') {
                        DRTSnackBar.display(
                            context, 'Please fill out all fields.',
                            backgroundColor: ibmAlertRed);
                      } else {
                        await Profile.write(jsonEncode({
                          'init': true,
                          'firstName': firstName,
                          'lastName': lastName,
                          'group': group,
                          'lang': 'en',
                          'avatar': image,
                        }));
                        Navigator.of(context).pop();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
