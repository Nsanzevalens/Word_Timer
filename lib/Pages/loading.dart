//import 'dart:js_util/js_util_wasm.dart';

import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'dart:js';
class LoadigScreen extends StatefulWidget {
  const LoadigScreen({Key? key}) : super(key: key);

  @override
  State<LoadigScreen> createState() => _LoadigScreenState();
}

class _LoadigScreenState extends State<LoadigScreen> {

void setUpWorldTime() async{
  WordTime instance =WordTime(location: 'Kigali',flag: 'Rwanda.png',url: 'Africa/kigali' );
   await instance.getData();
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':instance.location,
     'time':instance.time,
     'flag':instance.flag,
     'isDayTime':instance.isDayTime,
   }
   );



}

  int counter=0;
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(title: Text('World time'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
       body:Center(
        child:SpinKitFadingCircle(
          color: Colors.white,
          size: 90.0,
        ) ,
      ),
    );
  }
}
