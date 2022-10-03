import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/global_variable.dart';
import 'package:weather_app/model/lat_and_log.dart';

import '../service/location_client.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  LocationClient client = LocationClient();
  LatAndLong? hassan ;
  Future<void> getdata() async{
    hassan = await client.getLatAndLong(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Find your location'),

      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: getdata(),
                  builder:(context, snapshot){
                    if (snapshot.connectionState== ConnectionState.done){
                      return weatherParameter(hassan!.name!, hassan!.lat!, hassan!.lon!, hassan!.country!, hassan!.state!);
                    }return Center(child: const LinearProgressIndicator());
                  })

            ],
          ),
        ),
      ),
    );
  }
  Widget weatherParameter(String name, double lat, double lon, String country, String state,){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$name'),
            const SizedBox(height: 10,),
            Text('$lat'),
            const SizedBox(height: 10,),
            Text('$lon'),
            const SizedBox(height: 10,),
            Text('$country'),
            const SizedBox(height: 10,),
            Text('$state'),

          ],
        ),
      ),
    );
  }
}
