import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';

class TableTile extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Function onPressed;

  const TableTile({
    super.key,
    required this.title,
    this.iconData,
    this.iconColor = Colors.white,
    this.iconBackgroundColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        elevation: 0.0,
        backgroundColor: ibmGray['10'],
      ),
      child: ListTile(
        horizontalTitleGap: 2.0,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
        leading: iconData != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: iconBackgroundColor,
                  child: Icon(
                    iconData,
                    size: 20.0,
                    color: iconColor,
                  ),
                ),
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        trailing: const SizedBox(
          height: double.infinity,
          child: Icon(
            CupertinoIcons.right_chevron,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
