import 'package:flutter/material.dart';

class CitySelectionExample extends StatefulWidget {
  @override
  _CitySelectionExampleState createState() => _CitySelectionExampleState();
}

class _CitySelectionExampleState extends State<CitySelectionExample> {
  String selectedCity = ""; // Variable to store the selected city

  final List<String> cities = ['Rajkot', 'Ahemdabad', 'jamngar', 'Vadodra', 'Surat',];

  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog
          (

          title: Text('Select a City'),
          content: Container(
            width: double.maxFinite,

            child: ListView.builder(
              itemCount: cities.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index)
              {

                return RadioListTile<String>
                  (
                  title: Text(cities[index]),
                  value: cities[index],
                  groupValue: selectedCity,
                  onChanged: (String? value)
                  {
                    setState(() {
                      selectedCity = value!;
                    }
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected City:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              selectedCity,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showCitySelectionDialog,
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}