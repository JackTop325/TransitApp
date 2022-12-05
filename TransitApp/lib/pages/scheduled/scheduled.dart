import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/schedule.dart';
import 'package:transit_app/local_storage/schedule_model.dart';
import 'package:transit_app/pages/scheduled/edit_schedule.dart';
import 'package:transit_app/pages/scheduled/schedule_dialog.dart';
import 'package:transit_app/pages/scheduled/scheduled_form.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/local_storage/db_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
                  return Slidable(
                    closeOnScroll: true,
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) => editSchedule(context, index),
                          backgroundColor: ibmBlue['60'] as Color,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) =>
                              deleteSchedule(items[index].id!),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          backgroundColor: ibmAlertRed,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () async {
                        var details = await jsonDecode(items[index].details!);
                        showDialog<String>(
                            context: context,
                            builder: (context) => ScheduleDialog(
                                schedule: items[index], details: details));
                      },
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
                              '${items[index].hour!.toString()}:${items[index].minute! < 10 ? '0${items[index].minute!}' : items[index].minute!.toString()}',
                              style: const TextStyle(
                                  fontSize: 18.0, color: drtGreen),
                            ),
                          ]),
                    ),
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

  Future deleteSchedule(String id) async {
    await model.deleteScheduleWithId(id);
    reload();
  }

  Future editSchedule(BuildContext context, int index) async {
    Schedule schedule = items[index];
    String title;
    title = await showDialog(
        context: context,
        builder: (context) => EditSchedule(title: items[index].title!));
    schedule.title = title;
    // print(schedule);
    await model.updateSchedule(schedule);
    reload();
  }
}
