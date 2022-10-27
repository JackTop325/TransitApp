import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class stopDetailWidget extends StatefulWidget {
  const stopDetailWidget({Key? key}) : super(key: key);

  @override
  State<stopDetailWidget> createState() => _stopDetailWidgetState();
}

class _stopDetailWidgetState extends State<stopDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stop Name"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reminder Set'))
            );
          },
          icon: Icon(
            Icons.calendar_month,
            size: 26,
          ),
          label: Text("Reminder"),
        )
      ),
    );
  }
}
