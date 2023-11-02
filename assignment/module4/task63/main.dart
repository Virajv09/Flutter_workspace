import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
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
          appBar: AppBar(title: Text("alert dialog"),),
          body: Center(

            child: AlertDialog(

              title: Text("this is buttons"),

              actions: [

                Row(

                  children: [
                    TextButton(onPressed: ()
                        {
                          toast1();
                        },
                        child: Text("Positive"),
                    ),

                    TextButton(onPressed: ()
                    {
                      toast2();
                    },
                      child: Text("neutral"),
                    ),

                    TextButton(onPressed: ()
                    {
                      toast3();
                    },
                      child: Text("Negative"),),
                  ],
                )
              ],
            ),


          ),
       );
  }

  void toast1()
  {
    Fluttertoast.showToast(
        msg: "positive",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  }

  void toast2()
  {
    Fluttertoast.showToast(
        msg: "neutral",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black
    );
  }

  void toast3()
  {
    Fluttertoast.showToast(
        msg: "negative",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

}