import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';

class ScheduledForm extends StatefulWidget {
  ScheduledForm({super.key});

  @override
  State<ScheduledForm> createState() => _ScheduledFormState();
}

class _ScheduledFormState extends State<ScheduledForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          color: ibmGray['10'],
          child: Column(
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
                  const Text(
                    "Scheduled",
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
