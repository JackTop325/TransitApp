class AppConstants{
  static const String mapBoxStyleId = 'https://api.mapbox.com/styles/v1/jacktop/cla3027wf000314n4vt3ul2ze/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamFja3RvcCIsImEiOiJjbGEzMDFkNGowNHJrM3dyeHF2NzhweW41In0.4w3Kywz2NhFco_qfArQ8Lg';
  static const String mapBoxAccessToken = 'pk.eyJ1IjoiamFja3RvcCIsImEiOiJjbGEzMDdkeHkwZXFvM3FvYzJyNnQ1cTY5In0.DF-KCqd2MVSkAcSGE1xS0A';
}

main(){
  final estNow = DateTime.now();
  // print("${estNow.hour}:${estNow.minute}");

  String time = "19:01";
  int hour = int.parse(time.substring(0,2));
  int minute = int.parse(time.substring(3,5));
  DateTime temp = DateTime(estNow.year,estNow.month,estNow.day,hour,minute);
  temp = temp.subtract(const Duration(minutes: 15));

  if(temp.hour >= estNow.hour && temp.minute > estNow.minute){
    return true;
  }
  return false;
}

