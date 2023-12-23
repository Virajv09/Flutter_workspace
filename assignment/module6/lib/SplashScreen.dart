import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modual6/LoginScreen.dart';




class SplashScreen extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 300, height: 300,),
            Lottie.network(
              "https://paternalistic-hiera.000webhostapp.com/Images/Animation%20-%201698660503740.json",
              /*height: 200.0,*/
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