class BusRoute {
  String? id;
  bool? hasNotification;
  DateTime? departureTime;
  int? notifyPeriod;
  bool? repeatRoute;
  String? routeNumber;
  String? routeName;
  String? arrivalLocation;
  String? destination;
  DateTime? arrivalTime;

  BusRoute(
      {this.id,
      this.hasNotification,
      this.notifyPeriod,
      this.repeatRoute,
      this.routeNumber,
      this.routeName,
      this.arrivalLocation,
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
      'arrivalLocation': arrivalLocation,
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
    arrivalLocation = map['arrivalLocation'];
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
        'arrivalLocation: $arrivalLocation, '
        'destination: $destination, '
        'departureTime: $departureTime, '
        'arrivalTime: $arrivalTime';
  }
}
