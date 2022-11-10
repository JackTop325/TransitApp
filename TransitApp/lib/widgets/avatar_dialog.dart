import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
// import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transit_app/pages/settings/fares/fares_card.dart';
import 'package:transit_app/pages/settings/fares/fares_tile.dart';
import 'package:transit_app/pages/settings/fares/fares_list.dart';

class AvatarDialog extends StatefulWidget {
  AvatarDialog({super.key});

  @override
  State<AvatarDialog> createState() => _AvatarDialogState();
}

class _AvatarDialogState extends State<AvatarDialog> {
  List cards = [
    FaresCard(
      category: "Kids",
      range: "12 and under",
      avatar: "assets/kid.png",
      palette: ibmPurple,
      details: Expanded(
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, -30.0),
            child: const Text(
              'Free!',
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
          ),
        ),
      ),
    ),
    FaresCard(
      category: "Youth",
      range: "Ages 13 to 19",
      avatar: "assets/youth.png",
      palette: ibmMagenta,
      details: FaresList(
        tiles: [
          FaresTile(
            title: 'Single trip PRESTO tap',
            price: 2.90,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Monthly PRESTO pass',
            price: 93.50,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Cash (exact change)',
            price: 4.00,
            iconData: CupertinoIcons.money_dollar_circle_fill,
          ),
        ],
      ),
    ),
    FaresCard(
      category: "Adult",
      range: "Ages 20 to 64",
      avatar: "assets/adult.png",
      palette: ibmGreen,
      details: FaresList(
        tiles: [
          FaresTile(
            title: 'Single trip PRESTO tap',
            price: 3.25,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Monthly PRESTO pass',
            price: 117.0,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Cash (exact change)',
            price: 4.00,
            iconData: CupertinoIcons.money_dollar_circle_fill,
          ),
        ],
      ),
    ),
    FaresCard(
      category: "Senior",
      range: "Ages 65 and older",
      avatar: "assets/senior.png",
      palette: ibmBlue,
      details: FaresList(
        tiles: [
          FaresTile(
            title: 'Single trip PRESTO tap',
            price: 2.15,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Monthly PRESTO pass',
            price: 46.00,
            iconData: CupertinoIcons.creditcard_fill,
          ),
          FaresTile(
            title: 'Cash (exact change)',
            price: 2.75,
            iconData: CupertinoIcons.money_dollar_circle_fill,
          ),
        ],
      ),
    ),
  ];

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
            height: 425,
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          ),
          Positioned(
            top: -20.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 40.0,
                width: 200.0,
                color: ibmGreen['40'],
                child: Center(
                  child: Text(
                    'Fares',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: ibmGray['10'],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45.0),
            child: CarouselSlider.builder(
              itemCount: cards.length,
              itemBuilder: ((context, index, realIndex) {
                return cards[index];
              }),
              options: CarouselOptions(
                height: 350,
                enlargeCenterPage: true,
                clipBehavior: Clip.antiAlias,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
