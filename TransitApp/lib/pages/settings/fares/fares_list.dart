import 'package:flutter/material.dart';
import 'package:transit_app/pages/settings/fares/fares_tile.dart';

class FaresList extends StatelessWidget {
  final List<FaresTile> tiles;

  const FaresList({
    super.key,
    required this.tiles,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: tiles,
        ),
      ),
    );
  }
}
