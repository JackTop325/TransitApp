class ArrivalTime{
  String? title = "Bus Arriving Soon";
  String? body;
  String? payload = "Placeholder";
  var busId;
  var trip_id;
  var time;
  var stop_id;

  ArrivalTime(this.busId, this.trip_id, this.time, this.stop_id){
    body = "$busId is arriving soon";
  }

  String toString() {
    return 'ArrivalTime{trip_id: $trip_id, time: $time, stop_id: $stop_id}';
  }
}