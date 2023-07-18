//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_timer/Pages/home.dart';
import 'package:world_timer/Pages/loading.dart';
import 'package:world_timer/Pages/search_location.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/',
    routes: {
    '/':(context)=>LoadigScreen(),
      '/home':(context) =>Home(),
      '/search_location':(context)=>ChooseLocation(),
    },
    debugShowCheckedModeBanner: false,
  )
  );
}

