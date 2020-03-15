import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //this is the location
  String time; // this is the location time
  String flag; //this is the location flag
  String url; //this is the location url
  bool daytime; //this is used to identifi wheter it is day or night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      print('Loading the api from the fake api keu lunk');
//    we are going to use http for network request.
      Response response = await get(
          Uri.encodeFull('http://worldtimeapi.org/api/timezone/$url'));
//  print(response.body);
//  print('this is the loading class');
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offset = data['utc_datetime'].substring(1, 3);
//     print(datetime);
//     print(offset);
//   Ceating the datet time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
//      time=now.toString();
      daytime=now.hour>6 && now.hour <20? true:false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("cought Exception $e");
      time = "could%t get the time";
    }
  }
}
