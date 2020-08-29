// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:world_time/services/World_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.setTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 8),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }

}
