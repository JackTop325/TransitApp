class Bus{
  var route_id;
  var trip_headsign;

  Bus(this.route_id, this.trip_headsign);

  String toString() {
    return 'Bus{route_id: $route_id, trip_headsign: $trip_headsign}';
  }
}