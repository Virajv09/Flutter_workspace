import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String operation = "Add"; // Default operation
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Operation:'),
            RadioListTile(
              title: Text('Add'),
              value: "Add",
              groupValue: operation,
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Subtract'),
              value: "Subtract",
              groupValue: operation,
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Multiply'),
              value: "Multiply",
              groupValue: operation,
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Divide'),
              value: "Divide",
              groupValue: operation,
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 1'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double num1 = double.tryParse(num1Controller.text) ?? 0.0;
                double num2 = double.tryParse(num2Controller.text) ?? 0.0;

                double calculatedResult;

                switch (operation) {
                  case "Add":
                    calculatedResult = num1 + num2;
                    break;
                  case "Subtract":
                    calculatedResult = num1 - num2;
                    break;
                  case "Multiply":
                    calculatedResult = num1 * num2;
                    break;
                  case "Divide":
                    if (num2 != 0) {
                      calculatedResult = num1 / num2;
                    } else {
                      calculatedResult = double.infinity;
                    }
                    break;
                  default:
                    calculatedResult = 0.0;
                }

                setState(() {
                  result = "Result: $calculatedResult";
                });
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}