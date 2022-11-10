import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/pages/settings/fares/fares_dialog.dart';
import 'package:transit_app/pages/settings/about/about_dialog.dart';
import 'package:transit_app/widgets/table_tile.dart';
// import 'package:transit_app/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                    child: Image.asset(
                      'assets/avatar.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Jacob Swirl',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Center(
                child: Text(
                  'Stored locally',
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
                onPressed: () {},
              ),
              TableTile(
                title: 'Notifications',
                iconData: CupertinoIcons.bell,
                iconColor: Colors.white,
                iconBackgroundColor: ibmRed['60'],
                onPressed: () {},
              ),
              TableTile(
                title: 'Fares',
                iconData: CupertinoIcons.money_dollar,
                iconColor: Colors.white,
                iconBackgroundColor: ibmGreen['40'],
                onPressed: () => showDialog<String>(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => FaresDialog(),
                ),
              ),
              TableTile(
                title: 'Analytics',
                iconData: CupertinoIcons.chart_bar_square_fill,
                iconColor: Colors.white,
                iconBackgroundColor: ibmPurple['70'],
                onPressed: () {},
              ),
              TableTile(
                title: 'About',
                iconData: CupertinoIcons.info,
                iconColor: Colors.white,
                iconBackgroundColor: ibmCyan['60'],
                onPressed: () => showDialog<String>(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) =>
                      const SettingsAboutDialog(),
                ),
              ),
              const SizedBox(height: 20.0),
              TableTile(
                title: 'Reset',
                iconData: CupertinoIcons.gobackward,
                iconColor: Colors.white,
                iconBackgroundColor: ibmMagenta['60'],
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/');
                  });
                },
              ),
              TableTile(
                title: 'Sign Out',
                iconData: CupertinoIcons.person_badge_minus,
                iconColor: Colors.white,
                iconBackgroundColor: ibmTeal['50'],
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/login');
                  });
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
