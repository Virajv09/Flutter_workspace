import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: MyAnimation(),
    );
  }

}

class MyAnimation extends StatefulWidget{
  @override
  AnimationState createState() => AnimationState();
}
class AnimationState extends State<MyAnimation> {
  @override
  void initState()
  {
    /*Timer(
        Duration(seconds: 5),() => Navigator.push(context,MaterialPageRoute(builder: (context) => Mylogin()))
    );*/
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(

        child: Column(

          children: [

            Container(
                margin: const EdgeInsets.only(left: 500.0,right: 500.0,top: 400.0),
                child: Container()
            ),

            Lottie.network("https://paternalistic-hiera.000webhostapp.com/Images/animation_ll258dfz.json",

                height: 150.0,
                repeat: true,
                //reverse: true,
                animate: true)
          ],
        ),
      ),
    );
  }
}

