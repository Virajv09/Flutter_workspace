import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: firstpage(),
       debugShowCheckedModeBanner: false,
     );
  }

}

class firstpage extends StatefulWidget
{
  @override
  firstState createState() => firstState();


}

class firstState extends State<firstpage>
{
  @override
  Widget build(BuildContext context) {

       return Scaffold(
         appBar: AppBar(title: Text("call sms"),),
         body: Center(


           child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [

               IconButton(
                   onPressed:()
                    {
                       call1();
                    },
                   icon: Icon(Icons.call,color: Colors.green,size: 60,) ),

               SizedBox(width: 80,),

               IconButton(
                   onPressed:()
                   {
                     sms1();
                   },
                   icon: Icon(Icons.sms,color: Colors.blue,size: 60,) )
             ],
           ),

         ),
       );
  }

  void call1()
  {
    var url = Uri.parse("tel:6354073879");
    launchUrl(url);
  }

  void sms1()
  {
    var url = Uri.parse("sms:6354073879");
    launchUrl(url);
  }

}