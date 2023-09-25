import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackgroundChanger(),
    );
  }
}

class BackgroundChanger extends StatefulWidget {
  @override
  _BackgroundChangerState createState() => _BackgroundChangerState();
}

class _BackgroundChangerState extends State<BackgroundChanger> {
  // Define a variable to store the background color.
  Color _backgroundColor = Colors.blue;

  // Function to change the background color.
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Changer App'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('Change Background'),
          ),
        ),
      ),
    );
  }
}