import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class DRTElevatedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final IconData? iconData;
  final Color? iconColor;
  final Function onPressed;

  const DRTElevatedButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = ibmGreen60,
    this.iconData,
    this.iconColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 20.0),
          iconData != null
              ? Icon(
                  iconData,
                  color: iconColor,
                )
              : Container(),
        ],
      ),
    );
  }
}
