import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: FirstPage(),
    );
  }

}

// -----------------first page ------------------------------------

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Navigation or Routing"),),

      body: Center(

        child: Column(


          children: [

            ElevatedButton(onPressed: ()
            {

              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage() ));


            }, child: Text("Click Me"))

          ],


        ),

      ),


    );
  }

}


//---------------------seconed page ----------------------------


class SecondPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Second Page"),),
      body: Center(

        child: ElevatedButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          child:Text("Go Back"),


        ),

      ),

    );
  }

}