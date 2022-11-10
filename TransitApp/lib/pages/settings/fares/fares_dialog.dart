import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transit_app/pages/settings/fares/fare_details.dart';
import 'package:transit_app/widgets/title_dialog.dart';

class FaresDialog extends StatefulWidget {
  FaresDialog({super.key});

  @override
  State<FaresDialog> createState() => _FaresDialogState();
}

class _FaresDialogState extends State<FaresDialog> {
  @override
  Widget build(BuildContext context) {
    return TitleDialog(
      title: 'Fares',
      backgroundTitleColor: ibmGreen['40'],
      child: CarouselSlider.builder(
        itemCount: fareCards.length,
        itemBuilder: ((context, index, realIndex) {
          return fareCards[index];
        }),
        options: CarouselOptions(
          height: 350, enlargeCenterPage: true, initialPage: 2,
          // clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
