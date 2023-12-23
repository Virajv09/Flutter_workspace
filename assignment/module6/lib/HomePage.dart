import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';


class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Jay", messageType: "receiver"),
  ChatMessage(messageContent: "How have you?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Keval, I am fine.😁 you?", messageType: "sender"),
  ChatMessage(messageContent: "you?", messageType: "sender"),
  ChatMessage(messageContent: "I'm OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Really?", messageType: "sender"),
  ChatMessage(messageContent: "🙄🙄", messageType: "sender"),

];






class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage>
{
  late String emailId, pass;
  late SharedPreferences logindata;

  @override

  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    //newuser = (logindata.getBool('login') ?? true);
    setState(() {
      emailId = logindata.getString('emailId')!;
      pass = logindata.getString('pass')!;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 40, width: 40),
                Text(
                  "Chatter",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("by viraj"),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout')
                {
                  _logout();
                }
              },
              itemBuilder: (BuildContext context) {
                return ['logout'].map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 200,),

              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: ()
                      {

                      }, icon: Icon(Icons.send, color: Colors.white, size: 20,),),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("viraj vekaria"),
              accountEmail: Text("vekariyaviraj1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent[500],
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () {
                // Handle navigation to the home screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.pending_outlined),
              title: Text("about"),
              onTap: () {
                // Handle navigation to the account screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              onTap: () {
                // Handle navigation to the account screen
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async
  {

    logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', true); // Set the login flag back to true.
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context) => Login()));

  }
}