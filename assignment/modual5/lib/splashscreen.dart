import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'HomeScreen.dart';



class SplashScreen extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 300, height: 350,),
            Lottie.network("https://paternalistic-hiera.000webhostapp.com/Images/Animation%20-%201701510012047.json",
              height: 150.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}