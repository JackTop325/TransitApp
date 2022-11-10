import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class ScheduledList extends StatelessWidget {
  final String title;
  const ScheduledList({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            color: ibmGray80,
          ),
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: ibmGray20,
            child: const ListTile(
              leading: Icon(
                Icons.tram,
                color: drtGreen,
              ),
              title: Text(
                'Title',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(
                'Subtitle',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Icon(CupertinoIcons.repeat),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
