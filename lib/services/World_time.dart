import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for ui
  String time; // the time in that location
  String flag; //url to asset flag icon
  String url; // url for the location
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> setTime() async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);
      //create DateTime Object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = (now.hour >6 && now.hour < 20)? true : false;

      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error $e');
      time = 'could not get time data';
    }
  }

}

