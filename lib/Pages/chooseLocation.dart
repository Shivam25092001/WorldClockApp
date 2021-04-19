import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/WorldClockWidget.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  WorldTime choose= WorldTime(city: "", country: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Theme(
        data: ThemeData(
          hintColor: Colors.white
        ),
        child: Stack(
          children: [
            Transform.scale(
              scale: 0.7,
              child: Opacity(
                  opacity: 0.7,
                  child: Image.asset('Assets/Images/earth.jpg',fit: BoxFit.fitWidth,)
              ),
            ),
            Stack(
            children: [
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 250,
                              ),
                              Text("Choose Location",style: TextStyle(color: Colors.white, fontSize: 40.0),),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: TextFormField(
                                    cursorColor: Colors.green,
                                    style: TextStyle(color: Colors.green[500], fontWeight: FontWeight.normal, fontSize: 20.0),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.pink)),
                                        focusColor: Colors.green,
                                        hintStyle: TextStyle(color: Colors.white54),
                                        hintText: "Enter country",
                                        labelText: "Country",counterStyle: TextStyle(fontSize: 30),
                                      ),
                                      onChanged: (str) {
                                        setState(() {
                                          choose.country = str;
                                        });
                                      },
                                      /*validator: (String val) {
                                        if(val.isEmpty){
                                          return "Country cannot be empty";
                                        }
                                        return null ;
                                      }*/
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                               Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: TextFormField(
                                    cursorColor: Colors.green,
                                    style: TextStyle(color: Colors.green[500], fontWeight: FontWeight.normal, fontSize: 20.0),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.pink)),
                                      focusColor: Colors.white,
                                      hintStyle: TextStyle(color: Colors.white54),
                                      hintText: "Enter city",
                                      labelText: "City",counterStyle: TextStyle(fontSize: 30),
                                    ),
                                    onChanged: (str) {
                                      setState(() {
                                        choose.city = str;
                                      });
                                    },
                                    /*validator: (String val) {
                                      if(val.isEmpty){
                                        return "Country cannot be empty";
                                      }
                                      return null ;
                                    }*/
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, "/loading" , arguments: { "city" : choose.city , "country" : choose.country});
                                  },
                                  child: Container(
                                      child: Text("Search", )
                                  )
                              )
                            ]
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
          ]
        ),
      )
    );
  }
}
