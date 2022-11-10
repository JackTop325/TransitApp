import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  Timestamp? date;
  String? image;
  String? link;
  String? title;
  int? views;
  DocumentReference? reference;

  News.fromMap(var map, {this.reference}) {
    date = map['date'];
    image = map['image'];
    link = map['link'];
    title = map['title'];
    views = map['views'];
  }

  Map<String, Object?> toMap() {
    return {
      'date': date,
      'image': image,
      'link': link,
      'title': title,
      'views': views,
    };
  }

  @override
  String toString() {
    return 'News[title: $title, views: $views]';
  }
}
