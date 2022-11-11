class BusRoute {
  String? id;
  bool? hasNotification;
  DateTime? departureTime;
  int? notifyPeriod;
  bool? repeatRoute;
  String? routeNumber;
  String? routeName;
  String? departure;
  String? destination;
  DateTime? arrivalTime;

  BusRoute(
      {this.id,
      this.hasNotification,
      this.notifyPeriod,
      this.repeatRoute,
      this.routeNumber,
      this.routeName,
      this.departure,
      this.destination,
      this.departureTime,
      this.arrivalTime});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'hasNotification': hasNotification,
      'notifyPeriod': notifyPeriod,
      'repeatRoute': repeatRoute,
      'routeNumber': routeNumber,
      'routeName': routeName,
      'departure': departure,
      'destination': destination,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime
    };
  }

  BusRoute.fromMap(Map map) {
    id = map['id'];
    hasNotification = map['hasNotification'];
    notifyPeriod = map['notifyPeriod'];
    repeatRoute = map['repeatRoute'];
    routeNumber = map['routeNumber'];
    routeName = map['routeName'];
    departure = map['departure'];
    destination = map['destination'];
    departureTime = map['departureTime'];
    arrivalTime = map['arrivalTime'];
  }

  @override
  String toString() {
    return 'ID: $id, '
        'hasNotification: $hasNotification, '
        'notifyPeriod: $notifyPeriod, '
        'repeatRoute: $repeatRoute, '
        'routeNumber: $routeNumber, '
        'routeName: $routeName, '
        'departure: $departure, '
        'destination: $destination, '
        'departureTime: $departureTime, '
        'arrivalTime: $arrivalTime';
  }
}
