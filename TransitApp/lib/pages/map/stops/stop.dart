import 'package:latlong2/latlong.dart';

class Stop{
  var stop_id;
  var stop_name;
  LatLng? location;

  Stop(this.stop_id, this.stop_name, this.location);

  @override
  String toString() {
    return 'Stop{stop_id: $stop_id, stop_name: $stop_name, location: $location}';
  }
}