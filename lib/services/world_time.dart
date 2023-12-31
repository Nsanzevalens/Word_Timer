import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class WordTime{
  String location;
  var time;
  String flag;
  String url;
  bool isDayTime=true;
  WordTime({required this.location,required this.flag,required this.url,});

  Future<void> getData() async {
    try{
      var urli = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      http.Response response = await http.get(urli);
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime =data['datetime'];
      String offset =data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now= now.add(Duration(hours: int.parse(offset)) );
      isDayTime = now.hour >6 && now.hour < 20 ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch (e){

      print('Caught error:$e');
      time ="couldn't get time zone";


    }


  }
}
