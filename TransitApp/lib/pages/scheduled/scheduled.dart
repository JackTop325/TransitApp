import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/schedule.dart';
import 'package:transit_app/local_storage/schedule_model.dart';
import 'package:transit_app/pages/scheduled/scheduled_form.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/local_storage/db_utils.dart';

class ScheduledPage extends StatefulWidget {
  ScheduledPage({super.key});

  @override
  State<ScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<ScheduledPage> {
  ScheduleModel model = ScheduleModel();
  List<Schedule> items = [];

  @override
  void initState() {
    super.initState();
    reload();
  }

  void reload() {
    DBUtils.init().then((_) {
      model.getAllSchedules().then((schedules) {
        setState(() {
          items = schedules;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  const ScreenTitle(title: 'Scheduled'),
                  IconButton(
                    onPressed: () {
                      addSchedule(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.add,
                      color: drtGreen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   title: Text(items[index].title ?? ''),
                  // );
                  return ListTile(
                    horizontalTitleGap: 2.0,
                    leading: const Icon(
                      Icons.tram,
                      color: drtGreen,
                    ),
                    title: Text(
                      items[index].title ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      items[index].destination ?? '',
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            items[index].preference!.split(' ')[0],
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: drtGray,
                            ),
                          ),
                          Text(
                            '${items[index].hour!.toString()}:${items[index].minute!.toString()}',
                            style: const TextStyle(
                                fontSize: 18.0, color: drtGreen),
                          ),
                        ]),
                  );
                },
              ),
              // ScheduledList(title: 'Today'),
              // ScheduledList(title: 'All'),
            ],
          ),
        ),
      ),
    );
  }

  Future addSchedule(BuildContext context) async {
    var schedule = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ScheduledForm()),
    );
    await model.insertSchedule(schedule);
    reload();
  }
}
