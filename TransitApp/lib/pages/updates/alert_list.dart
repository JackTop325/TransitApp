import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/firebase/alert.dart';
import 'package:transit_app/firebase/news.dart';

class AlertList extends StatefulWidget {
  const AlertList({super.key});

  @override
  State<AlertList> createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('alerts')
          .orderBy('posted', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs
                  .map<Widget>((document) => buildAlertCard(context, document))
                  .toList(),
            ),
          );
        }
      },
    );
  }

  Widget buildAlertCard(BuildContext context, DocumentSnapshot alertData) {
    final alert =
        Alert.fromMap(alertData.data(), reference: alertData.reference);
    return GestureDetector(
      onTap: (() {
        // setState(() {});
      }),
      child: ListTile(
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
      ),
    );
  }
}
