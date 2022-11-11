class ArrivalTime{
  String? busId;
  String? routeName;
  String? title = "Bus Arriving Soon";
  String? body;
  String? payload = "Placeholder";
  int? hour;
  int? minute;

  ArrivalTime({this.busId,this.routeName,this.hour, this.minute}){
    body = "$busId $routeName is arriving soon";
  }
}