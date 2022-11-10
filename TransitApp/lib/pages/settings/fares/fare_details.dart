import 'package:flutter/cupertino.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/pages/settings/fares/fares_card.dart';
import 'package:transit_app/pages/settings/fares/fares_tile.dart';
import 'package:transit_app/pages/settings/fares/fares_list.dart';

List fareCards = [
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
