import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/scheduled/scheduled_list.dart';

class ScheduledPage extends StatefulWidget {
  ScheduledPage({super.key});

  @override
  State<ScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<ScheduledPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        color: ibmGray['10'],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Scheduled",
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/scheduled');
                    },
                    icon: const Icon(
                      CupertinoIcons.add,
                      color: drtGreen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ScheduledList(title: 'Today'),
              ScheduledList(title: 'All'),
            ],
          ),
        ),
      ),
    );
  }
}
