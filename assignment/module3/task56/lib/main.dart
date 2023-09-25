import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageWithTextLayout(),

      );
  }
}

class ImageWithTextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("images"),),

        body: Center(

            child: Container(

              child: Column(

                children: [

                  Image.network("https://paternalistic-hiera.000webhostapp.com/Images/naturalplace.jpg",
                    width:100,
                    height: 100,),

                  SizedBox(width: 100),

                  Row(
                    children: [

                      Image.network("https://paternalistic-hiera.000webhostapp.com/Images/naturalplace.jpg",
                        width:100,
                        height: 100,),

                      SizedBox(width: 100),

                      Text("abc"),

                      SizedBox(width: 100),

                      Image.network("https://paternalistic-hiera.000webhostapp.com/Images/naturalplace.jpg",
                        width:100,
                        height: 100,),
                    ],
                  ),
                  Image.network("https://paternalistic-hiera.000webhostapp.com/Images/naturalplace.jpg",
                    width:100,
                    height: 100,)
                ],

              ),

            )
        )

    );
  }

}
