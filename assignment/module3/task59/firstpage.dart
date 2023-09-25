
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task59/seconedpage.dart';

class firstpage extends StatefulWidget{
  @override
  firstState createState() => firstState();

}

class firstState extends State<firstpage>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(title: Text("register form"),),

        body:Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(

                decoration: const InputDecoration
                  (
                  icon: const Icon(Icons.person),
                  hintText: "Enter Your Firstname",
                  labelText: 'Firstname',
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter firstname';
                  }
                  return null;
                },


              ),

              TextFormField(

                decoration: const InputDecoration
                  (
                  icon: const Icon(Icons.person),
                  hintText: "Enter Your LastName",
                  labelText: 'Lastname',
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter Lastname';
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

              TextFormField(

                decoration: const InputDecoration
                  (
                  icon: Icon(Icons.password_rounded),
                  hintText: "Enter Your confirm Password",
                  labelText: 'confirm Password',
                ),
                obscureText: true,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Please enter confirm Password';
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
                  child: Text("Register")
              )
            ],


          )
        ),
          floatingActionButton: FloatingActionButton
            (
            child: Icon(Icons.navigate_next_rounded),
            onPressed: ()
            {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => seconedpage()));
            },
          )

      );
  }
}