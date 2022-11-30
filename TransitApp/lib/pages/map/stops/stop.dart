import 'package:latlong2/latlong.dart';

class Stop{
  var stop_id;
  var stop_code;
  var stop_name;
  double? stop_lat;
  double? stop_lon;

  Stop({this.stop_id, this.stop_code, this.stop_name, this.stop_lat,
      this.stop_lon});

  factory Stop.fromMap(Map map){
    return Stop(
      stop_id: map['stop_id'],
      stop_code: map['stop_code'],
      stop_name: map['stop_name'],
      stop_lat: map['stop_lat'],
      stop_lon: map['stop_lon'],
    );
  }
}