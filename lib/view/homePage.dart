import 'package:flutter/material.dart';
import 'package:weather_app/view/locationInfo.dart';

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
      body: SafeArea(
        child: Column(

          children: [
            const SizedBox(height: 40,),
            const Align(
                alignment: AlignmentDirectional.topCenter,
                child: Text('Location App', style: TextStyle(color: Colors.green, fontSize: 30,
                fontWeight: FontWeight.bold
                ),)),
            const SizedBox(height: 150,),
            LocationApp(),


          ],
        ),
      ),
    );
  }



  Widget LocationApp(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [


             TextFormField(
               controller: controller,
              decoration:  const InputDecoration(
                hintText: 'Type in your State',
              ),
             ),
              const SizedBox(height: 20,),
              ElevatedButton(

                  onPressed: (){
                location = controller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const LocationInfo()));},
                  style: ElevatedButton.styleFrom(
              primary: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),

                  child: const Text('proceed'),
        )

            ],
          ),
        ),
      ),
    );
  }
}
