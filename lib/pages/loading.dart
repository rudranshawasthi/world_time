import 'package:flutter/material.dart';
import 'package:world_time/services/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London',flag: 'image.png',url: 'Europe/London');
    await instance.setTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
