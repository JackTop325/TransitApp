import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:transit_app/colors.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final int views;
  final String imageUrl;
  final Color? backgroundColor;

  const NewsCard({
    super.key,
    required this.title,
    required this.views,
    required this.imageUrl,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      width: 200.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(150, 100, 100, 100),
                      BlendMode.darken,
                    ),
                    // child: Image.network(
                    //   imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Image.asset(
                      'assets/bus_uoit.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 16.0,
                  top: 8.0,
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.eye_fill,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        views.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 80.0,
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(
                title,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
