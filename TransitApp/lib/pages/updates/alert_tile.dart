import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/firebase/alert.dart';

class AlertTile extends StatelessWidget {
  final Alert alert;
  const AlertTile({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: alert.isDetour == false
          ? const Icon(
              CupertinoIcons.exclamationmark_octagon,
              color: ibmAlertRed,
            )
          : const Icon(
              CupertinoIcons.exclamationmark_triangle,
              color: ibmAlertYellow,
            ),
      title: Text(alert.title!),
      subtitle: Text(alert.when ?? alert.description!),
    );
  }
}
