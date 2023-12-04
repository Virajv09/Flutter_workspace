import 'package:flutter/material.dart';

import 'dynamicList.dart';

void main()
{
  runApp(MaterialApp(


      debugShowCheckedModeBanner: false,
      home:DynamicListView(mobilelist: [],)));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Custom List"),),
      body: getdata(),

    );

  }
//Static List
  Widget getdata()
  {
    var listview = ListView(
      children: [

        ListTile
          (
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("Beautiful View !"),
        ),

        ListTile
          (
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("Beautiful View !"),
        )

      ],
    );

    return listview;
  }

}