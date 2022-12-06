import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transit_app/pages/setup/setup_3.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/drt_snackbar.dart';

class SetupPageTwo extends StatefulWidget {
  final String firstName;
  final String lastName;
  const SetupPageTwo({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<SetupPageTwo> createState() => _SetupPageTwoState();
}

class _SetupPageTwoState extends State<SetupPageTwo> {
  int selectedIndex = -1;
  List groups = [
    {
      'group': 'Kid',
      'desc': 'Ages 12 and under',
      'filename': 'kid.png',
    },
    {
      'group': 'Youth',
      'desc': 'Ages 13 - 19',
      'filename': 'youth.png',
    },
    {
      'group': 'Adult',
      'desc': 'Ages 20 - 64',
      'filename': 'adult.png',
    },
    {
      'group': 'Senior',
      'desc': 'Ages 65 and older',
      'filename': 'senior.png',
    },
  ];
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
                const SizedBox(height: 32.0),
                Center(
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    color: ibmGreen['80'],
                    height: 100.0,
                  ),
                ),
                const SizedBox(height: 64.0),
                const Text(
                  'Select your age group:',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: groups.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedIndex == index ? drtGreen : ibmGray['20'],
                    ),
                    child: ListTile(
                      onTap: () => setState(() => selectedIndex = index),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/${groups[index]['filename']}',
                          height: 64,
                        ),
                      ),
                      title: Text(
                        groups[index]['group'],
                        style: TextStyle(
                          fontSize: 22,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        groups[index]['desc'],
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedIndex == index
                              ? ibmGray['20']
                              : ibmGray['70'],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18.0),
                DRTElevatedButton(
                  text: 'Continue',
                  iconData: CupertinoIcons.arrow_right_circle_fill,
                  iconColor: ibmGreen['10'],
                  onPressed: () {
                    if (selectedIndex == -1) {
                      DRTSnackBar.display(context, 'Please select a group.',
                          backgroundColor: ibmAlertRed);
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetupPageThree(
                              firstName: widget.firstName,
                              lastName: widget.lastName,
                              group: groups[selectedIndex]['group'],
                            ),
                          ));
                    }
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
