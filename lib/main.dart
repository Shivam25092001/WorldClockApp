import 'package:flutter/material.dart';
import 'package:world_time/Pages/chooseLocation.dart';
import 'package:world_time/Pages/loaddata.dart';
import 'Pages/homePage.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     //home: worldClock(),
      initialRoute: "/chooseLocation",
      routes: {
       "/loading" : (context) => loadData(),
        "/chooseLocation" : (context) => chooseLocation(),
      }
    );
  }
}

