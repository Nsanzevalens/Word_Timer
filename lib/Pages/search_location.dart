import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WordTime> locations =[
    WordTime(location: 'london', flag: 'uk.png', url:'Europe/london'),
    WordTime(location:'Athens' , flag: 'greece.png', url:'Europe/berlin' ),
    WordTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WordTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WordTime(location: 'chicago', flag: 'usa.png', url: 'America/chicago'),
    WordTime(location: 'New_york', flag: 'usa.png', url: 'America/New_york'),
    WordTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WordTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WordTime(location:'kigali',flag:'rwanda.png',url: 'Africa/kigali' )

  ];
  void updateTime(index) async{
    WordTime instances = locations[index];
    await instances.getData();

    Navigator.pop(context,{
      'location':instances.location,
      'time':instances.time,
      'flag':instances.flag,
      'isDayTime':instances.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Choose a location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),

      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index ){
          return Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4.0),
            child: Card(
              color: Colors.grey[0],
              child: ListTile(

                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),

            ),
          );
        }
      ),

    );
  }
}
