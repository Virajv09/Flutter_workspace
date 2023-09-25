import 'package:flutter/material.dart';
import 'package:task51/seconedpage.dart';

class firstpage extends StatelessWidget {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'First Number'),
            ),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Second Number'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen and pass the numbers as arguments
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    int firstNumber =
                        int.tryParse(firstNumberController.text) ?? 0;
                    int secondNumber =
                        int.tryParse(secondNumberController.text) ?? 0;

                    return NumberListScreen(
                      firstNumber: firstNumber,
                      secondNumber: secondNumber,
                    );
                  },
                ));
              },
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}