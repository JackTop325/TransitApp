import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/scheduled/scheduled_list.dart';

class ScheduledPage extends StatefulWidget {
  const ScheduledPage({super.key});

  @override
  State<ScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<ScheduledPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        color: ibmGray10,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32.0),
              const Text(
                "Scheduled",
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(height: 18.0),
              ScheduledList(title: 'Today'),
              const SizedBox(height: 18.0),
              ScheduledList(title: 'All'),
            ],
          ),
        ),
      ),
    );
  }
}
