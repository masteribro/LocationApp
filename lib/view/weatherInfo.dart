import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
  Widget weatherParameter(IconData icon, String temp, String Location){
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 10,),
        Text('$temp'),
        SizedBox(height: 10,),
        Text('$Location'),

      ],
    );
  }
}
