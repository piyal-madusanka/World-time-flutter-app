import 'package:flutter/material.dart';
import 'package:sampleProject/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
 void getWorldTime()async{
 WorldTime now=WorldTime(location:'sri lanka',flag:'sri lanka',url:'Asia/Colombo');
   await now.getData();
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':now.location,
     'flag':now.flag,
     'time':now.time,
     'isDaytime':now.isDaytime
     });
 }


  @override
  void initState() {
    super.initState();
    getWorldTime(); 
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.blue[900],
      body: Center(
        child:SpinKitFadingCube(
         color: Colors.white,
         size: 80.0,
        ) ,
        )
    );
  }
}