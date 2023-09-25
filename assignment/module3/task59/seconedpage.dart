
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task59/firstpage.dart';

class seconedpage extends StatefulWidget{
  @override
  seconedState createState() => seconedState();

}

class seconedState extends State<seconedpage>

{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

      return Scaffold(
         appBar: AppBar(title: Text("login form"),),

        body: Form(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              TextFormField(

                decoration: const InputDecoration
                  (
                  icon: const Icon(Icons.email),
                  hintText: "Enter Your Email",
                  labelText: 'E-mail',
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter Email';
                  }
                  return null;
                },

              ),
              TextFormField(

                decoration: const InputDecoration
                  (
                  icon: const Icon(Icons.password),
                  hintText: "Enter Your Password",
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: ()
              {
                if(_formKey.currentState!.validate())
                {
                  print("Data Processing");
                }
              },
                  child: Text("Login")
              )



            ],

          ),

        ),
          floatingActionButton: FloatingActionButton
            (
            child: Icon(Icons.navigate_before_rounded),
            onPressed: ()
            {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => firstpage()));
            },
          )

      );
  }

}