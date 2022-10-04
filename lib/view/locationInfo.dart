import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/global_variable.dart';
import 'package:weather_app/model/lat_and_log.dart';

import '../service/location_client.dart';

class LocationInfo extends StatefulWidget {
  const LocationInfo({Key? key}) : super(key: key);

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  LocationClient client = LocationClient();
  LatAndLong? hassan ;
  Future<void> getdata() async{
    hassan = await client.getLatAndLong(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
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
                      return locationParameter(hassan!.name!, hassan!.lat!, hassan!.lon!, hassan!.country!, hassan!.state!);
                    }return Center(child: const LinearProgressIndicator());
                  })

            ],
          ),
        ),
      ),
    );
  }
  Widget locationParameter(String name, double lat, double lon, String country, String state,){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('State:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('$name', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latitude:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('$lat', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Longitude:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('$lon', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Country:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('$country',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),

            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('State:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('$state', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
