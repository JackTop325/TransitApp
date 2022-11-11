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
      'id': this.id,
      'hasNotification': this.hasNotification,
      'notifyPeriod': this.notifyPeriod,
      'repeatRoute': this.repeatRoute,
      'routeNumber': this.routeNumber,
      'routeName': this.routeName,
      'arrivalLocation': this.arrivalLocation,
      'destination': this.destination,
      'departureTime': this.departureTime,
      'arrivalTime': this.arrivalTime
    };
  }

  BusRoute.fromMap(Map map) {
    this.id = map['id'];
    this.hasNotification = map['hasNotification'];
    this.notifyPeriod = map['notifyPeriod'];
    this.repeatRoute = map['repeatRoute'];
    this.routeNumber = map['routeNumber'];
    this.routeName = map['routeName'];
    this.arrivalLocation = map['arrivalLocation'];
    this.destination = map['destination'];
    this.departureTime = map['departureTime'];
    this.arrivalTime = map['arrivalTime'];
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
