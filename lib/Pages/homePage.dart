import 'package:world_time/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class worldClock extends StatefulWidget {
  @override
  _worldClockState createState() => _worldClockState();
}

class _worldClockState extends State<worldClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("World Clock"),
        centerTitle: true,


      ),
    );
  }
}