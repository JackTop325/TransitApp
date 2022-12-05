class Schedule {
  String? id;
  String? title;
  String? departure;
  String? destination;
  String? preference;
  int? hour;
  int? minute;
  String? details;

  Schedule({
    this.id,
    this.title,
    this.departure,
    this.destination,
    this.preference,
    this.hour,
    this.minute,
    this.details,
  });

  Schedule.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    departure = map['departure'];
    destination = map['destination'];
    preference = map['preference'];
    hour = map['hour'];
    minute = map['minute'];
    details = map['details'];
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'departure': departure,
      'destination': destination,
      'preference': preference,
      'hour': hour,
      'minute': minute,
      'details': details
    };
  }

  @override
  String toString() {
    return 'Schedule[id: $id, title: $title]';
  }
}
