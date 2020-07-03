import 'package:flutter/material.dart';
import 'package:sampleProject/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location =[
   WorldTime(url:'Europe/London', location:'London' , flag:'uk.png'),
   WorldTime(url:'Europe/Berlin', location:'Athens' , flag:'greece.png'),
   WorldTime(url:'Africa/Cairo', location:'Cairo' , flag:'egypt.png'),
   WorldTime(url:'Africa/Nairobi', location:'Nairobi' , flag:'kenya.png'),
   WorldTime(url:'America/Chicago', location:'Chicago' , flag:'usa.png'),
   WorldTime(url:'America/New_York', location:'New York' , flag:'usa.png'),
   WorldTime(url:'Asia/Seoul', location:'Seoul' , flag:'south_korea.png'),
   WorldTime(url:'Asia/Jakarta', location:'Jakarta' , flag:'indonesia.png'),

  ];
   
   void updatetime(index) async{
    WorldTime instance=location[index];
    await instance.getData();
    print(instance.time);
    Navigator.pop(context,{
     'location':instance.location,
     'time':instance.time,
     'isDaytime':instance.isDaytime
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
       appBar: AppBar(backgroundColor: Colors.blue[900],
       title: Text('choose your loaction'),
       centerTitle: true,
       elevation: 0,
       ),
       body:ListView.builder(
         itemCount:location.length ,
         itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0),
             child: Card(
               child:ListTile(
                 onTap: (){
                   updatetime(index);
                 },
                 title: Text(location[index].location),
                 leading:CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                 ),
               ) ,
               ),
           );

         }
         )
       );
       

       
      
  }
}