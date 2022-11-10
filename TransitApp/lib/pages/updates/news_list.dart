import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transit_app/pages/updates/news_card.dart';
import 'package:transit_app/firebase/news.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('news')
          .orderBy('date')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return SizedBox(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs
                  .map<Widget>((document) => buildNewsCard(context, document))
                  .toList(),
            ),
          );
        }
      },
    );
  }

  Widget buildNewsCard(BuildContext context, DocumentSnapshot newsData) {
    final news = News.fromMap(newsData.data(), reference: newsData.reference);
    return GestureDetector(
      onTap: (() {
        // setState(() {});
      }),
      child: NewsCard(
        title: news.title!,
        views: news.views!,
        imageUrl: news.image!,
      ),
    );
  }
}
