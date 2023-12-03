import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main()
{
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}