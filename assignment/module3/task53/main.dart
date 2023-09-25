import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Size Changer',
      home: FontSizeChanger(),
    );
  }
}

class FontSizeChanger extends StatefulWidget {
  @override
  _FontSizeChangerState createState() => _FontSizeChangerState();
}

class _FontSizeChangerState extends State<FontSizeChanger> {
  double fontSize = 16.0;

  void increaseFontSize() {
    setState(() {
      fontSize += 2.0;
    });
  }

  void decreaseFontSize() {
    setState(() {
      fontSize -= 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Changer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Font Size: ${fontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: increaseFontSize,
                  icon: Icon(Icons.add_circle_rounded,color: Colors.green,size: 40,),

                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: decreaseFontSize,
                  icon: Icon(Icons.remove_circle_rounded,color: Colors.red,size: 40,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}