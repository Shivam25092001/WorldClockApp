import 'package:flutter/material.dart';
import '../WorldClockWidget.dart';
import 'package:intl/intl.dart';

class loadData extends StatefulWidget {
  @override
  _loadDataState createState() => _loadDataState();
}


class _loadDataState extends State<loadData> {

   String time = 'Loading...';
   Map inputData = {};

  void setData({String ci, String co}) async{

    WorldTime n = WorldTime(city: ci, country: co);
    print(n.country + n.city);
    await n.getData();
    print(n.time);
    //String now= n.time;
    setState(() {
      time = DateFormat.jm().format(DateTime.parse(n.time));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData(ci:"London",co: "Europe");
  }

  @override
  Widget build(BuildContext context) {

    inputData = ModalRoute.of(context).settings.arguments;
    String inputCity = inputData["city"];
    String inputCountry = inputData["country"];

    setData(ci: inputCity, co: inputCountry);


    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children: [
            Transform.scale(
              scale: 0.7,
              child: Opacity(
                  opacity: 0.7,
                  child: Image.asset('Assets/Images/earth.jpg',fit: BoxFit.fitWidth,)
              ),
            ),
            SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      SizedBox(height: 150,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(inputCountry ,style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                      Text(", " ,style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text(inputCity ,style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.green ),),
                    ]),   //Location
                      SizedBox(height: 30,),
                      Text("Current Time: " + time,style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Change Location",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.white),),
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}
