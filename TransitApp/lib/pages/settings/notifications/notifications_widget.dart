import 'package:flutter/material.dart';
import 'package:transit_app/notifications/notification.dart';

import '../../../colors.dart';
import '../../../widgets/screen_title.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _notifications = Notifications();
  List pendingNotifications = [];

  @override
  void initState() {
    super.initState();
    _getPendingNotifications();
  }

  Future _getPendingNotifications() async {
    var pendingNotificationRequests =
        await _notifications.getPendingNotificationRequests();

    for (var pendNot in pendingNotificationRequests) {
      pendingNotifications.add("${pendNot.body}");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _notifications.init();
    if (pendingNotifications.isEmpty) {
      return Scaffold(
        body: SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: drtGreen,
                        ),
                      ),
                      const ScreenTitle(title: 'Notifications'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "No Notifications Set",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: drtGreen,
                      ),
                    ),
                    const ScreenTitle(title: 'Notifications'),
                  ],
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 450,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: pendingNotifications.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  Text(" ${pendingNotifications[index]}"),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
