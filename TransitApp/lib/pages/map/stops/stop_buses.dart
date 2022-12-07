import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/map/stops/stop_detail_widget.dart';
import 'package:transit_app/pages/map/stops/trip.dart';
import 'package:transit_app/widgets/screen_title.dart';

class StopBuses extends StatefulWidget {
  StopBuses({super.key, required this.stop_id});

  var stop_id;

  @override
  State<StopBuses> createState() => _StopBusesState();
}

class _StopBusesState extends State<StopBuses> {
  Set buses = {};
  List bus_ids = [];
  List bus_list = [];
  List trip_ids = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    String response =
        await rootBundle.loadString('assets/schedule/stop_times.json');
    List stopTimes = json.decode(response);

    response = await rootBundle.loadString('assets/schedule/trips.json');
    List tripData = json.decode(response);

    for (int i = 0; i < stopTimes.length; i++) {
      if (stopTimes[i]["stop_id"] == widget.stop_id) {
        bus_ids.add(stopTimes[i]["trip_id"]);
      }
    }
    for (int i = 0; i < bus_ids.length; i++) {
      for (int j = 0; j < tripData.length; j++) {
        if (bus_ids[i] == tripData[j]["trip_id"]) {
          Trip trip = Trip(tripData[j]["route_id"], tripData[j]["trip_id"],
              tripData[j]["trip_headsign"]);
          trip_ids.add(trip);
          buses.add(tripData[j]["route_id"]);
        }
      }
    }
    bus_list = buses.toList();
    bus_list.sort((a, b) => a.toString().compareTo(b.toString()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    const ScreenTitle(title: 'Buses'),
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
                          itemCount: bus_list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ibmGray['20'],
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.tram,
                                  color: drtGreen,
                                  size: 32,
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: drtGreen,
                                  size: 32,
                                ),
                                title: Text("${bus_list[index]}"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StopDetailWidget(
                                          trip_ids: trip_ids,
                                          route_id: bus_list[index],
                                          stop_id: widget.stop_id,
                                        ),
                                      ));
                                },
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
