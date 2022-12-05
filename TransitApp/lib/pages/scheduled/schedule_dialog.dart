import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/schedule.dart';
import 'package:transit_app/widgets/title_dialog.dart';

class ScheduleDialog extends StatefulWidget {
  final Schedule schedule;
  final dynamic details;
  const ScheduleDialog(
      {super.key, required this.schedule, required this.details});

  @override
  State<ScheduleDialog> createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  @override
  Widget build(BuildContext context) {
    dynamic steps = widget.details['routes'][0]['legs'][0]['steps'];
    String departureTime =
        '${widget.details['routes'][0]['legs'][0]['departure_time']['text']}';
    String arrivalTime =
        '${widget.details['routes'][0]['legs'][0]['arrival_time']['text']}';
    return TitleDialog(
      title: widget.schedule.title!,
      height: 300,
      backgroundTitleColor: drtGreen,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.schedule.departure} to',
                style: TextStyle(
                  color: ibmGray['60'],
                  fontSize: 17.0,
                ),
              ),
              Text(
                '${widget.schedule.destination}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$departureTime - $arrivalTime',
                  style: const TextStyle(color: drtGreen),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.location_north_line_fill),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.details['routes'][0]['legs'][0]['distance']
                          ['text'],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 4, 67, 23),
                      ),
                    ),
                    Container(
                      height: 24.0,
                      width: 1.0,
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color.fromARGB(255, 168, 168, 168),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const Icon(CupertinoIcons.clock_solid),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.details['routes'][0]['legs'][0]['duration']['text']
                          .replaceAll(RegExp(r'hours'), 'h'),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 4, 67, 23),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: steps.length,
                  itemBuilder: ((context, index) => ListTile(
                        minLeadingWidth: 4.0,
                        leading: steps[index]['travel_mode'] == 'WALKING'
                            ? const Icon(
                                Icons.directions_walk_rounded,
                                color: drtGray,
                              )
                            : const Icon(
                                Icons.tram,
                                color: Color.fromARGB(255, 14, 96, 39),
                              ),
                        title: Text('${steps[index]['html_instructions']}'),
                        subtitle: steps[index]['travel_mode'] == 'WALKING'
                            ? Text(steps[index]['distance']['text'])
                            : Text(steps[index]['transit_details']
                                ['arrival_time']['text']),
                      )),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
