import 'package:flutter/material.dart';

class FaresCard extends StatelessWidget {
  final String category;
  final String range;
  final String avatar;
  final Map<String, Color> palette;
  final Widget? details;

  FaresCard({
    super.key,
    required this.category,
    required this.range,
    required this.avatar,
    required this.palette,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 1.8,
        //   color: secondaryColor ?? Colors.black,
        // ),
        borderRadius: BorderRadius.circular(12.0),
        color: palette['20'],
      ),
      padding: const EdgeInsets.all(16.0),
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 20.0,
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      // width: 200,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  height: 65.0,
                  width: 65.0,
                  child: Image.asset(avatar),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: palette['90'],
                    ),
                  ),
                  Text(
                    range,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: palette['100'],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 30,
            thickness: 1.0,
            indent: 8.0,
            endIndent: 8.0,
            color: palette['30'],
          ),
          details ?? Container(),
        ],
      ),
    );
  }
}
