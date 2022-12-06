import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/settings/safety/cases_graph.dart';
import 'package:transit_app/widgets/screen_title.dart';

class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key});

  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    const ScreenTitle(title: 'Safety'),
                  ],
                ),
                const SizedBox(height: 32.0),
                const Text(
                  "Covid-19 has had a widespread impact on people all over "
                  "the world, affecting our daily lives in various ways. We "
                  "are taking the appropriate steps to ensure safety is our "
                  "top priority.",
                  style: TextStyle(color: drtGreen, fontSize: 18),
                ),
                const SizedBox(height: 32.0),
                const Center(
                    child: Text('Reported Covid-19 Cases',
                        style: TextStyle(fontSize: 18))),
                const SizedBox(height: 32.0),
                const CasesGraph(),
                const SizedBox(height: 32.0),
                Text(
                  "Best Practices",
                  style: TextStyle(color: ibmGreen['70'], fontSize: 24),
                ),
                const SizedBox(height: 12.0),
                const ListTile(
                  leading: Icon(
                    Icons.social_distance_rounded,
                    size: 56,
                    color: drtGreen,
                  ),
                  title: Text(
                    'Social Distance',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Leave seats empty in between when possible',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.masks_rounded,
                    size: 56,
                    color: drtGreen,
                  ),
                  title: Text(
                    'Wear a mask',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "It is strongly recommended to wear a mask in indoor "
                    "public settings",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.sanitizer_rounded,
                    size: 56,
                    color: drtGreen,
                  ),
                  title: Text(
                    'Clean your hands',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "We reccomend sanitizing your hands before coming on and "
                    "after leaving the bus",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
