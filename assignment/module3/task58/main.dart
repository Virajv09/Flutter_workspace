import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() {
  runApp(ColorChangeApp());
}

class ColorChangeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Change Example',
      home: ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  void _updateBackgroundColor() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(
      redValue.toInt(),
      greenValue.toInt(),
      blueValue.toInt(),
      1,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Red: ${redValue.toInt()}'),
            FlutterSlider(
              values: [redValue],
              max: 255,
              min: 0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                redValue = lowerValue;
                _updateBackgroundColor();
              },
            ),
            Text('Green: ${greenValue.toInt()}'),
            FlutterSlider(
              values: [greenValue],
              max: 255,
              min: 0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                greenValue = lowerValue;
                _updateBackgroundColor();
              },
            ),
            Text('Blue: ${blueValue.toInt()}'),
            FlutterSlider(
              values: [blueValue],
              max: 255,
              min: 0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                blueValue = lowerValue;
                _updateBackgroundColor();
              },
            ),
            SizedBox(height: 20),
            Container(
              width: 500,
              height: 500,
              color: backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}