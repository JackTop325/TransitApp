import 'package:flutter/material.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:transit_app/widgets/drt_snackbar.dart';

import '../../../notifications/notification.dart';
import 'arrival_times.dart';

class StopDetailWidget extends StatefulWidget {
  const StopDetailWidget({Key? key}) : super(key: key);

  @override
  State<StopDetailWidget> createState() => _StopDetailWidgetState();
}

class _StopDetailWidgetState extends State<StopDetailWidget> {
  final _formKey = GlobalKey<FormState>();
  final _notifications = Notifications();

  final List<ArrivalTime> _arrivals = [
    ArrivalTime(busId: '1a', routeName: 'Somewhere East', hour: 1, minute: 30),
    ArrivalTime(busId: '1b', routeName: 'Route East', hour: 1, minute: 45),
    ArrivalTime(busId: '2', routeName: 'Route West', hour: 2, minute: 30),
    ArrivalTime(busId: '2a', routeName: 'Route North', hour: 2, minute: 30),
    ArrivalTime(busId: '3', routeName: 'Route South', hour: 1, minute: 45),
  ];
  bool? _isSelected = false;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();
    _notifications.init();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stop Name"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              if (_isSelected!) {
                _notificationLater(_arrivals[_selectedIndex!]);
                DRTSnackBar.display(
                  context,
                  'Reminder set',
                  duration: 1000,
                );
              } else {
                DRTSnackBar.display(
                  context,
                  'No time selected',
                  duration: 1000,
                );
              }
            },
            icon: const Icon(
              Icons.calendar_month,
              size: 26,
            ),
            label: Text("Set Reminder"),
          )
        ],
      ),
      body: _buildArrivalTimeList(),
    );
  }

  Widget _buildArrivalTimeList() {
    if (_arrivals.isEmpty) {
      return const Center(
        child: Text(
          "No Times Found",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: _arrivals.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title:
              Text("${_arrivals[index].busId!} ${_arrivals[index].routeName!}"),
          subtitle: Text("${_arrivals[index].hour}:${_arrivals[index].minute}"),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
              _isSelected = true;
            });
          },
        );
      },
    );
  }

  Future _notificationLater(ArrivalTime arrival) async {
    //Will temporally use current time
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // time will be from storage
    tz.TZDateTime scheduledTime = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, now.hour, now.minute, now.second);

    scheduledTime = scheduledTime.add(Duration(seconds: 1));

    await _notifications.sendNotificationLater(
        arrival.title!, arrival.body!, arrival.payload!, scheduledTime);
  }
}
