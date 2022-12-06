import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/drt_snackbar.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/widgets/text_input.dart';
import 'package:transit_app/local_storage/schedule.dart';
import 'package:transit_app/pages/google/directions_repository.dart';

class ScheduledForm extends StatefulWidget {
  ScheduledForm({super.key});

  @override
  State<ScheduledForm> createState() => _ScheduledFormState();
}

class _ScheduledFormState extends State<ScheduledForm> {
  DirectionsRepository dr = DirectionsRepository(dio: Dio());
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title = '';
  String departure = '';
  String destination = '';
  List<String> schedulePreferences = ['Depart at', 'Arrive by'];
  String schedulePreference = 'Depart at';
  TimeOfDay timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
          color: ibmGray['10'],
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    const ScreenTitle(title: 'Create route'),
                  ],
                ),
                const SizedBox(height: 64.0),
                Image.asset('assets/city_bus.png'),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: TextEditingController(text: title),
                  onChanged: (value) => title = value,
                  decoration: TextInput.textInputDecoration(
                    label: 'Title',
                    placeholder: 'Name your route',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: TextEditingController(text: departure),
                  onChanged: (value) => departure = value,
                  decoration: TextInput.textInputDecoration(
                    label: 'Departure',
                    placeholder: 'Enter address',
                    iconData: CupertinoIcons.location,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: TextEditingController(text: destination),
                  onChanged: (value) => destination = value,
                  decoration: TextInput.textInputDecoration(
                    label: 'Destination',
                    placeholder: 'Enter address',
                    iconData: CupertinoIcons.location,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      value: schedulePreference,
                      items: schedulePreferences
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          schedulePreference = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black),
                      ),
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: timeOfDay,
                        ).then(
                          (value) {
                            setState(() {
                              timeOfDay = value!;
                            });
                          },
                        );
                      },
                      child: Text(
                          '${timeOfDay.hour.toString()}:${timeOfDay.minute < 10 ? '0${timeOfDay.minute}' : timeOfDay.minute.toString()}'),
                    ),
                    // child: Text('works')),
                  ],
                ),
                const SizedBox(height: 32.0),
                // Expanded(
                //   child: Container(),
                // ),
                DRTElevatedButton(
                  text: 'Submit',
                  onPressed: () async {
                    if (title.trim() == '' ||
                        departure.trim() == '' ||
                        destination.trim() == '') {
                      DRTSnackBar.display(context, 'Please fill out all fields',
                          backgroundColor: ibmAlertRed);
                      return;
                    }

                    String details = await dr.getDirections(
                      origin: departure,
                      destination: destination,
                      timeOfDay: timeOfDay,
                      isDeparting:
                          schedulePreference == 'Depart at' ? true : false,
                    );

                    var detailsObj = await jsonDecode(details);

                    if (detailsObj["status"] == 'NOT_FOUND') {
                      // ignore: use_build_context_synchronously
                      DRTSnackBar.display(context, 'No routes found',
                          backgroundColor: ibmAlertRed);
                      return;
                    } else if (detailsObj["status"] == 'ZERO_RESULTS') {
                      // ignore: use_build_context_synchronously
                      DRTSnackBar.display(context, 'No routes found',
                          backgroundColor: ibmAlertRed);
                      return;
                    }

                    List<String> time = detailsObj['routes'][0]['legs'][0][
                            schedulePreference == 'Depart at'
                                ? 'departure_time'
                                : 'arrival_time']['text']
                        .split(':');

                    Navigator.of(context).pop(
                      Schedule(
                        id: id,
                        title: title,
                        departure: departure,
                        destination: destination,
                        preference: schedulePreference,
                        hour: int.parse(time[0]) + 12,
                        minute: int.parse(time[1].substring(0, 2)),
                        details: details,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
