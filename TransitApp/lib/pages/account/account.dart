import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/widgets/table_tile.dart';
// import 'package:transit_app/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: ibmGray10,
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
              const Center(
                child: Text(
                  'Stored locally',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: ibmGray60,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Divider(
                thickness: 1.0,
                color: ibmGray30,
              ),
              const SizedBox(height: 8.0),
              TableTile(
                title: 'Notifications',
                iconData: CupertinoIcons.bell,
                iconColor: Colors.white,
                iconBackgroundColor: ibmRed60,
                onPressed: () {},
              ),
              TableTile(
                title: 'Fares',
                iconData: CupertinoIcons.money_dollar,
                iconColor: Colors.white,
                iconBackgroundColor: ibmGreen40,
                onPressed: () {},
              ),
              TableTile(
                title: 'Analytics',
                iconData: CupertinoIcons.chart_bar_square_fill,
                iconColor: Colors.white,
                iconBackgroundColor: ibmPurple70,
                onPressed: () {},
              ),
              TableTile(
                title: 'About',
                iconData: CupertinoIcons.info,
                iconColor: Colors.white,
                iconBackgroundColor: ibmCyan60,
                onPressed: () {},
              ),
              const SizedBox(height: 20.0),
              TableTile(
                title: 'Reset',
                iconData: CupertinoIcons.gobackward,
                iconColor: Colors.white,
                iconBackgroundColor: ibmMagenta60,
                onPressed: () {},
              ),
              TableTile(
                title: 'Sign Out',
                iconData: CupertinoIcons.person_badge_minus,
                iconColor: Colors.white,
                iconBackgroundColor: ibmTeal50,
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}