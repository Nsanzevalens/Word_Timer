import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  
  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty?data:ModalRoute.of(context)?.settings.arguments as Map;

   print(data);
   String bgImage = data['isDayTime'] ? 'day.jpeg':'night.png';

    return Scaffold(

      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          ),

        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0), child:  SafeArea(
           child: Column(
              children: [
               FlatButton.icon(onPressed:()
               async{
               dynamic result = await Navigator.pushNamed(context, '/search_location');
               setState(() {
                 data ={
                   "time":result['time'],
                   "location":result['location'],
                   "isDayTime":result['isDayTime'],
                   "flag":result['flag']
                 };
               });
                          },
                  icon: Icon(Icons.edit_location),
                   label: Text('Edit location'),
                                  ),
                        SizedBox(height: 20.0,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                                     Text(
                          data['location'],
                          style: TextStyle(
                           fontSize: 28.0,
                           letterSpacing: 2.0
                           ),
                           ),
                           ],
                           ),
                                  SizedBox(height: 20.0,),
                            Text(data['time'],
              style: TextStyle(
                fontSize: 66.0
              ),
            ),
    ],
    ),
    ),
      ),)

    );
  }
}
