import 'package:flutter/material.dart';

class TitleDialog extends StatefulWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundTitleColor;
  final Widget child;
  final double? height;

  const TitleDialog({
    super.key,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundTitleColor = Colors.black,
    required this.child,
    this.height = 425.0,
  });

  @override
  State<TitleDialog> createState() => _TitleDialogState();
}

class _TitleDialogState extends State<TitleDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: widget.height,
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          ),
          Positioned(
            top: -20.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 40.0,
                width: 200.0,
                color: widget.backgroundTitleColor,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: widget.titleColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45.0),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
