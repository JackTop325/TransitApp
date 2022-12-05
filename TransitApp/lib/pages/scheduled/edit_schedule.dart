import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/text_input.dart';
import 'package:transit_app/widgets/title_dialog.dart';

class EditSchedule extends StatefulWidget {
  String title;
  EditSchedule({
    super.key,
    required this.title,
  });

  @override
  State<EditSchedule> createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    return TitleDialog(
      title: 'Edit',
      height: 100,
      backgroundTitleColor: drtGreen,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const SizedBox(height: 8.0),
            DRTElevatedButton(
              text: 'Save',
              // textColor: ibmGreen['20'],
              backgroundColor: Colors.black,
              onPressed: () {
                if (title.trim() != '') {
                  Navigator.of(context).pop(title);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
