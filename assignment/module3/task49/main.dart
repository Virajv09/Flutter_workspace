import 'package:flutter/material.dart';
import 'package:task49/page1.dart';
import 'package:task49/page2.dart';

void main() {
  runApp( MaterialApp(

    title: "this is UI",
    theme: ThemeData(primarySwatch:Colors.green
    ),
    debugShowCheckedModeBanner: false,

    home: page1(),
  ));
}

