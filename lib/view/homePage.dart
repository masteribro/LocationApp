import 'package:flutter/material.dart';
import 'package:weather_app/view/weatherInfo.dart';

import '../model/global_variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey formkey = GlobalKey();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            weatherApp()

          ],
        ),
      ),
    );
  }



  Widget weatherApp(){
    return Center(
      child: Form(
        key: formkey,
        child: Column(
          children: [
           TextFormField(
             controller: controller,
            decoration: const InputDecoration(
              hintText: 'Type in your State',
            ),
           ),
            ElevatedButton(onPressed: (){
              // if(formkey.currentState?.validate() == true){}
              location = controller.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  WeatherInfo()));}, child: Text('proceed'))
          ],
        ),
      ),
    );
  }
}
