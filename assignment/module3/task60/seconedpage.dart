import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task60/firstpage.dart';

class seconedpage extends StatefulWidget{
  @override
  seconedState createState() => seconedState();
}

class seconedState extends State<seconedpage>
{
  int number = 12;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orange,

      body: Center(
          child: Stack(
            children: [

              Container(
                margin: EdgeInsets.only(top: 40),

                child: IconButton(
                    iconSize: 30,
                    onPressed: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage()));
                    },
                    icon: Icon(Icons.arrow_back)),
              ),

              Container(
                margin: EdgeInsets.only(top: 40,left: 360),

                child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_rounded)),
              ),
              Container(

                margin: EdgeInsets.only(top: 200),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
              ),
              Positioned(

                  top: 150,
                left: 140,

                  child: ClipOval(
                      child: Image.network("https://paternalistic-hiera.000webhostapp.com/Images/OIP.jpeg",
                        height: 150,
                        width: 150,
                      fit: BoxFit.cover,),

                  ),
              ),
               Positioned(
                  child:Text("Sei Ua Samun phrai",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              top: 350,
              left:125,),

              Positioned(
                  child: Icon(Icons.access_time,color: Colors.blue,),
              top: 390,
              left: 90,),
              Positioned(
                child: Text("50min"),
                top: 395,
                left: 115,
              ),

              Positioned(
                child: Icon(Icons.star,color: Colors.orange,),
                top: 390,
                left: 190,
              ),

              Positioned(
                child: Text("4.8"),
                top: 395,
                left: 215,
              ),

              Positioned(
                child: Icon(Icons.local_fire_department,color: Colors.orange,),
                top: 390,
                left: 285,
              ),

              Positioned(
                child: Text("325 Kcal"),
                top: 395,
                left: 310,
              ),

              Positioned(
                top: 450,
                left: 155,
                child: Container(

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.orange),),


                  child: Row(
                      children: [

                         Text('\$'+'$number'),

                        IconButton(onPressed:()
                        {
                         incrementno();
                        }, icon: Icon(Icons.plus_one)),

                        IconButton(onPressed:()
                        {
                          decrementno();
                        }, icon: Icon(Icons.exposure_minus_1)),
                      ],
                  ),
                ),
                   ),

              Positioned(
                child: Text("Ingredirnta",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                top: 540,
                left: 25,
              ),

              Positioned(
                top: 590,
                  left: 70,
                  child: Row(
                    children: [

                    Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // Border radius for the container
                      child: Image.network("https://paternalistic-hiera.000webhostapp.com/Images/noodles.jpg", // Replace with your image file path
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover, // BoxFit to cover the container
                      )
                    ),
                    ),

                      SizedBox(width: 40,),

                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0), // Border radius for the container
                            child: Image.network("https://paternalistic-hiera.000webhostapp.com/Images/shrimp.jpeg", // Replace with your image file path
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                      SizedBox(width: 40,),

                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0), // Border radius for the container
                            child: Image.network("https://paternalistic-hiera.000webhostapp.com/Images/egg.jpeg", // Replace with your image file path
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                      SizedBox(width: 40,),

                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0), // Border radius for the container
                            child: Image.network("https://paternalistic-hiera.000webhostapp.com/Images/scallion.jpeg", // Replace with your image file path
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                    ],

              ),
              ),
              Positioned(

                  top: 670,
                  left: 65,
                  child: Row(

                  children: [

                    Text("Noodles"),

                    SizedBox(width: 40,),

                    Text("Shrimp"),

                    SizedBox(width: 40,),

                    Text("Egg"),

                    SizedBox(width: 40,),

                    Text("Scallion"),

                    SizedBox(width: 40,),
                  ],
                  ),
              ),

              Positioned(

                top: 710,
                left: 25,
                  child: Text("about",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

              Positioned(
                  top: 750,
                  left: 30,
                  child: Text("A vibreant Thai sausage made qith ground chicken, plus its \n spicy  chile dip,from chef parmass sayang of Atlanta's \n talat market.")
              )


            ],
          ),
        ),


        floatingActionButton: FloatingActionButton
          (
          child: Icon(Icons.shopping_bag_outlined,color: Colors.black,),
          backgroundColor: Colors.orange,

          onPressed: ()
          {
           // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => page1()));
          },

        )
      );

  }

  void incrementno()
  {
    setState(() {
      number = number + 12;
    });
  }

  void decrementno()
  {
    setState(() {
      number = number - 12;
    });
  }

}