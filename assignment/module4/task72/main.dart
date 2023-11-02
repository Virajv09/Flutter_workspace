import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstLaunch = prefs.getBool('firstLaunch') ?? true;

  runApp(MaterialApp(home: firstLaunch ? FirstLaunchScreen(prefs) : MainScreen()));
}

class FirstLaunchScreen extends StatelessWidget {
  final SharedPreferences prefs;

  FirstLaunchScreen(this.prefs);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome to the Phone Call App!'),
              ElevatedButton(
                onPressed: () {
                  showPermissionDialog(context);
                  prefs.setBool('firstLaunch', false);
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Phone Call App'),
        ),
        body: Center(
          child: Text('Your app content goes here.'),
        ),
      ),
    );
  }
}

Future<void> showPermissionDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Permission Request'),
        content: Text('Allow access to make phone calls?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Deny'),
          ),
          TextButton(
            onPressed: () async {
              var status = await Permission.phone.request();
              if (status.isGranted) {
                Navigator.of(context).pop();
              }
            },
            child: Text('Allow'),
          ),
        ],
      );
    },
  );
}