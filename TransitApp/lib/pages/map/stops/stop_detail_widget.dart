import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:transit_app/widgets/drt_snackbar.dart';
import 'package:transit_app/notifications/notification.dart';
import '../../../colors.dart';
import '../../../widgets/screen_title.dart';

class StopDetailWidget extends StatefulWidget {
   StopDetailWidget({Key? key,
     required this.trip_ids,
     required this.route_id,
     required this.stop_id}) : super(key: key);

  List trip_ids;
  var route_id;
  var stop_id;

  @override
  State<StopDetailWidget> createState() => _StopDetailWidgetState();
}

class _StopDetailWidgetState extends State<StopDetailWidget> {
  final _notifications = Notifications();
  int est_offset = 5;

  bool? _isSelected = false;
  int? _selectedIndex;
  Set _times = {};
  List _bus_trips = [];
  List _arrival_times = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    String response = await rootBundle.loadString('assets/schedule/stop_times.json');
    List stopTimes = json.decode(response);

    for (int i = 0; i < widget.trip_ids.length; i++) {
      if(widget.trip_ids[i].route_id == widget.route_id){
        _bus_trips.add(widget.trip_ids[i]);
      }
    }

    for (int i = 0; i < stopTimes.length; i++) {
      if(stopTimes[i]["stop_id"] == widget.stop_id){
        for (int j = 0;j<_bus_trips.length;j++){
          if(stopTimes[i]["trip_id"] == _bus_trips[j].trip_id && _isValidTime(stopTimes[j]["arrival_time"].substring(0, stopTimes[j]["arrival_time"].length - 3))){
            _times.add(stopTimes[j]["arrival_time"].substring(0, stopTimes[j]["arrival_time"].length - 3));
          }
        }
      }
    }
    _arrival_times = _times.toList();
    _arrival_times.sort((a, b) => a.compareTo(b));
    setState(() {});
  }

  bool _isValidTime(String time){
    final estNow = DateTime.now();
    // print("${estNow.hour}:${estNow.minute}");

    int hour = int.parse(time.substring(0,2));
    int minute = int.parse(time.substring(3,5));
    DateTime temp = DateTime(estNow.year,estNow.month,estNow.day,hour,minute);
    temp = temp.subtract(const Duration(minutes: 15));

    if(temp.hour >= estNow.hour && temp.minute > estNow.minute){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();
    _notifications.init();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ScreenTitle(title: '${widget.route_id.toString()} Stop Times'),
                  ],
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_isSelected!) {
                        _notificationLater(_arrival_times[_selectedIndex!]);
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
                  ),
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
                          itemCount: _arrival_times.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  Text("${_arrival_times[index]}"),
                                ],
                              ),
                              selected: index == _selectedIndex,
                              onTap: (){
                                _selectedIndex = index;
                                _isSelected = true;
                                setState(() {
                                });
                              },
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

  Future _notificationLater(String arrival) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final estNow = DateTime.now();
    // print("${estNow.hour}:${estNow.minute}");

    int hour = int.parse(arrival.substring(0,2));
    int minute = int.parse(arrival.substring(3,5));
    DateTime temp = DateTime(estNow.year,estNow.month,estNow.day,hour,minute);
    temp = temp.subtract(const Duration(hours: 5,minutes: 15));

    tz.TZDateTime scheduledTime = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, hour, minute, now.second);

    scheduledTime = scheduledTime.add(const Duration(milliseconds: 1));

    await _notifications.sendNotificationLater(
        "Bus Arriving Soon",
        "${widget.route_id} is arriving soon",
        "Placeholder",
        scheduledTime
    );
  }
}
