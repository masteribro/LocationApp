import 'package:flutter/material.dart';
import 'package:weather_app/view/weatherInfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          weatherApp()

        ],
      ),
    );
  }



  Widget weatherApp(){
    return Center(
      child: Column(
        children: [
         TextFormField(
          decoration: InputDecoration(
            hintText: 'Type in your location'
          ),
         ),
          ElevatedButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  WeatherInfo()));}, child: Text('proceed'))
        ],
      ),
    );
  }
}
