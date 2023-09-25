import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task49/page1.dart';
import 'package:url_launcher/url_launcher.dart';

class page2 extends StatefulWidget{
  @override
  pageState createState() => pageState();
}
class pageState extends State<page2>
{
  @override
  Widget build(BuildContext context) {

     return Scaffold(

       body: Stack(

         children: [
            Positioned  (
              child:    Image.network("https://paternalistic-hiera.000webhostapp.com/Images/naturalplace.jpg",
                      height: 334.5,width:450),
              top: 7.5
              ),

     /*      Align(
             alignment: Alignment.centerLeft,
             child: Text("Lauterbrunnen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

           ),
           Align(
             alignment: Alignment.centerLeft,
             child: Text("Village in Switzerland"),

           ),*/
           Positioned(
               child:Text("Lauterbrunnen",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
             left:10 ,
             top: 345,

           ),
           Positioned(
             child: Text("Village in Switzerland"),
             left:10 ,
             top: 380,

           ),
           Positioned(
             child: Icon(Icons.star,color: Colors.red,),
             left:330,
             top: 360,

           ),
           Positioned(
             child: Text("41",style: TextStyle(fontSize: 17),),
             left:355,
             top: 364,

           ),
           Positioned(
             left:80,
             top: 450,
             child: IconButton(
                    onPressed:()
                   {
                       call();
                   },
                   icon: Icon(Icons.call),
                   color: Colors.blue,
                   tooltip: 'call',

             ),
           ),
           Positioned(
             left:198,
             top: 450,
             child: IconButton(
               onPressed:()
               {

               },
               icon: Icon(Icons.send),
               color: Colors.blue,
               tooltip: 'route',

             ),
           ),
           Positioned(
             left:310,
             top: 450,
             child: IconButton(
               onPressed:()
               {

               },
               icon: Icon(Icons.share),
               color: Colors.blue,
               tooltip: 'share',

             ),
           ),
            Positioned(
                          child: Text("Lauterbrunnen is a municipality in the Swiss Alps. It\n encompasses the village of Lauterbrunnen, set in a valley\n featuring rocky cliffs and the roaring, 300m-­high Staubbach Falls.\n Nearby, the glacial waters of Trümmelbach Falls gush through\n mountain crevices past viewing platforms. A cable car runs from\n Stechelberg village to Schilthorn mountain, for views over the\n Bernese Alps. ― Google",
                          ),

              left:10 ,
              top: 550,
             ),


         ],
       ),
         floatingActionButton: FloatingActionButton
           (
           child: Icon(Icons.navigate_before_rounded),
           backgroundColor: Colors.blue,

           onPressed: ()
           {
             Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => page1()));
           },

         )
     );
  }

  void call()
  {
    var url = Uri.parse("tell:6354073879");
    launchUrl(url);
  }
}