
import 'package:flutter/material.dart';
import 'package:sampleProject/pages/choose_location.dart';
import 'package:sampleProject/pages/home.dart';
import 'package:sampleProject/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/chooselocation':(context)=>ChooseLocation()
    },
  ));
}

