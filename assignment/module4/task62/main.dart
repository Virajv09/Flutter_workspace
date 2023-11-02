import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        home: firstpage(),
      );
  }

}

class firstpage extends StatefulWidget
{
  @override
  firstState createState() => firstState();

}

class firstState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {

        return Scaffold(
           appBar: AppBar(title: Text("alert dialog",),),

            body: Center(

            child: ElevatedButton(
              onPressed: ()
              {
                showmydialog();
              },
              child: Text("alert dialog"),),
        ),
        );
  }

  void showmydialog()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text("alert dialog"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning, color: Colors.red, size: 50.0,),

            SizedBox(height: 10.0,),

            Text("this is dangerous")
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("close"),
          ),
        ],
      );
    },
    );
  }
}