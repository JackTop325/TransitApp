import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/local_storage/schedule_model.dart';
import 'package:transit_app/pages/privacy_policy.dart';
import 'package:transit_app/pages/settings/account/account.dart';
import 'package:transit_app/pages/settings/fares/fares_dialog.dart';
import 'package:transit_app/pages/settings/about/about_dialog.dart';
import 'package:transit_app/pages/settings/holidays/holiday_dialog.dart';
import 'package:transit_app/pages/settings/notifications/notifications_widget.dart';
import 'package:transit_app/pages/settings/safety/safety.dart';
import 'package:transit_app/widgets/table_tile.dart';
import 'package:transit_app/local_storage/profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ScheduleModel model = ScheduleModel();
  dynamic profile = {};
  String base64Image = '';

  @override
  void initState() {
    super.initState();
    reload();
  }

  void reload() {
    Profile.read().then((value) async {
      dynamic json = await jsonDecode(value);
      setState(() {
        profile = json;
        base64Image = json['avatar'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: ibmGray['10'],
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              Center(
                child: CircleAvatar(
                  radius: 72.0,
                  child: ClipOval(
                    child: profile == {}
                        ? Image.asset(
                            'assets/avatar.jpg',
                          )
                        : base64Image == ''
                            ? Image.asset(
                                'assets/anonymous.jpg',
                              )
                            : Image.memory(
                                base64Decode(base64Image),
                                height: 144,
                                width: 144,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                profile == {}
                    ? 'Loading...'
                    : '${profile['firstName']} ${profile['lastName']}',
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Center(
                child: Text(
                  profile == {} ? 'Loading...' : '${profile['group']}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: ibmGray['60'],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Divider(
                thickness: 1.0,
                color: ibmGray['30'],
              ),
              const SizedBox(height: 8.0),
              TableTile(
                title: 'Account',
                iconData: CupertinoIcons.person,
                iconColor: Colors.white,
                iconBackgroundColor: ibmBlue['50'],
                onPressed: () async {
                  // DRTSnackBar.display(context, 'Feature in progress...');
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountPage(
                          profile: profile,
                        ),
                      ));
                  reload();
                },
              ),
              TableTile(
                title: 'Notifications',
                iconData: CupertinoIcons.bell,
                iconColor: Colors.white,
                iconBackgroundColor: ibmRed['60'],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const NotificationPage())));
                },
              ),
              TableTile(
                title: 'Fares',
                iconData: CupertinoIcons.money_dollar,
                iconColor: Colors.white,
                iconBackgroundColor: ibmGreen['40'],
                onPressed: () => showDialog<String>(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => const FaresDialog(),
                ),
              ),
              TableTile(
                title: 'Safety',
                iconData: Icons.masks,
                iconColor: Colors.white,
                iconBackgroundColor: ibmPurple['70'],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SafetyPage())));
                },
              ),
              TableTile(
                title: 'Holidays',
                iconData: CupertinoIcons.calendar,
                iconColor: Colors.white,
                iconBackgroundColor: ibmCyan['60'],
                onPressed: () => showDialog<String>(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => const HolidayDialog(),
                ),
              ),
              TableTile(
                title: 'About',
                iconData: CupertinoIcons.info,
                iconColor: Colors.white,
                iconBackgroundColor: ibmGray['50'],
                onPressed: () => showDialog<String>(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) =>
                      const SettingsAboutDialog(),
                ),
              ),
              const SizedBox(height: 20.0),
              TableTile(
                title: 'Privacy Policy',
                iconData: CupertinoIcons.person_badge_minus,
                iconColor: Colors.white,
                iconBackgroundColor: ibmTeal['50'],
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => PrivacyPolicy()));
                },
              ),
              TableTile(
                title: 'Reset',
                iconData: CupertinoIcons.gobackward,
                iconColor: Colors.white,
                iconBackgroundColor: ibmMagenta['60'],
                onPressed: () async {
                  await Profile.write(jsonEncode({
                    'init': false,
                    'firstName': '',
                    'lastName': '',
                    'group': '',
                    'lang': 'en',
                    'avatar': '',
                  }));
                  await model.deleteAll();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
