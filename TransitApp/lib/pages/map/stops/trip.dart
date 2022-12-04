class Trip{
  var route_id;
  var trip_id;
  var trip_headsign;

  Trip(this.route_id, this.trip_id, this.trip_headsign);

  String toString() {
    return 'Trip{route_id: $route_id, trip_id: $trip_id, trip_headsign: $trip_headsign}';
  }
}
