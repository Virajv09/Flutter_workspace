import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Options Menu Example'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle the selected option here
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[

                  PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('profile'),
                  ),

                  PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('logout'),

                  ),

                ];
              },
            ),
          ],
        ),
        body: Center(
          child: Text(' '),
        ),
      ),
    );
  }
}