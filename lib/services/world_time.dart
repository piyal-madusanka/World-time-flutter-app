import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

 String time;
 String url;
 String location;
 String flag;
 bool isDaytime;

WorldTime({this.location,this.flag,this.url});

Future <void> getData()async{
  try{
    Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);  
    //print(data);
    String datetime=data['datetime'];
    String ofsetHours=data['utc_offset'].substring(1,3);
    String ofsetminuts=data['utc_offset'].substring(4,6);
  
   DateTime now=DateTime.parse(datetime);
   now = now.add(Duration(hours:int.parse(ofsetHours),minutes:int.parse(ofsetminuts)));   
   isDaytime =6<now.hour && now.hour<20 ? true : false;
   time=DateFormat.jm().format(now);
  }catch(error){
      print('erro : $error');
      time='coudnt load time';
  }
  }




}

