import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/title_dialog.dart';
import 'package:transit_app/pages/settings/holidays/holday_details.dart';

class HolidayDialog extends StatelessWidget {
  const HolidayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleDialog(
      title: 'Holidays',
      height: 300.0,
      backgroundTitleColor: ibmCyan['60'],
      child: Container(
        height: 350,
        // margin: EdgeInsets.only(left: 32.0),
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: holidays.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    holidays[index]['date']!.toString().split(' ')[0],
                  ),
                  Text(
                    holidays[index]['date']!.toString().split(' ')[1],
                  ),
                ],
              ),
              title: Text(
                holidays[index]['holiday']!.toString(),
              ),
              subtitle: Text(
                holidays[index]['service']!.toString(),
              ),
              trailing: const Icon(CupertinoIcons.calendar),
            );
          },
        ),
      ),
    );
  }
}
