import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  bool? isDetour;
  Timestamp? posted;
  String? title;
  String? when;
  String? routes;
  String? description;
  DocumentReference? reference;

  Alert.fromMap(var map, {this.reference}) {
    isDetour = map['isDetour'];
    posted = map['posted'];
    title = map['title'];
    when = map['when'];
    routes = map['routes'];
    description = map['description'];
  }

  Map<String, Object?> toMap() {
    return {
      'isDetour': isDetour,
      'posted': posted,
      'title': title,
      'when': when,
      'routes': routes,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Alert[title: $title]';
  }
}
