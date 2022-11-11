import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class FaresTile extends StatelessWidget {
  final String title;
  final double price;
  final IconData iconData;
  final Map<String, Color> palette;

  const FaresTile({
    super.key,
    required this.title,
    required this.price,
    required this.iconData,
    this.palette = ibmGray,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8.0,
      leading: Icon(
        iconData,
        color: palette['80'],
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
    );
  }
}
