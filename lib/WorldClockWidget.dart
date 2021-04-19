import 'dart:convert';
import 'package:http/http.dart';


class WorldTime {
  String city;
  String country;
  String time;

  Future<void> getData() async {

    try {
      var response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$country/$city'));
      //var response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));
      Map data = jsonDecode(response.body);
      //print("hello $data");
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime + offset);

      DateTime now = DateTime.parse(datetime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    }
    catch (e) {
      time = "error finding the location";
    }

  }
  WorldTime({this.country, this.city, this.time});
}

