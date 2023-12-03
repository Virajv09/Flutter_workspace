import 'package:flutter/material.dart';


import 'Dbdart.dart';
import 'TaskTab.dart';




class AddTask extends StatefulWidget {
  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask>
{

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  String? selectedPriority; // Store the selected priority
  DateTime? selectedDate; // Store the selected date
  TimeOfDay? selectedTime; // Store the selected time
  late bool completed = false;



  MyDb mydb = MyDb();

  @override
  void initState()
  {
    super.initState();
    mydb.open();
  }

  Future<void> addTask() async {
    // Format the date as "dd-mm-yyyy"
    String? formattedDate = selectedDate != null
        ? "${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}"
        : null;

    await mydb.db.rawInsert("INSERT INTO Task (name, description, date, time, priority, completed) VALUES (?, ?, ?, ?, ?, 0);",
        [name.text, description.text, formattedDate, selectedTime?.format(context), selectedPriority]);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("New Task Added")));

    name.text = "";
    description.text = "";
    selectedPriority = null;
    selectedDate = null;
    selectedTime = null;
  }

  Future<void> _selectDate() async {
    final DateTime pickedDate = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay pickedTime = (await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ))!;
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Task",
              ),
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Priority:"),
                Column(
                  children: [
                    Radio<String>(
                      value: "normal",
                      groupValue: selectedPriority,
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value;
                        });
                      },
                    ),
                  ],
                ),
                Text("Normal"),
                Radio<String>(
                  value: "medium",
                  groupValue: selectedPriority,
                  onChanged: (value) {
                    setState(() {
                      selectedPriority = value;
                    });
                  },
                ),
                Text("Medium"),
                Radio<String>(
                  value: "high",
                  groupValue: selectedPriority,
                  onChanged: (value) {
                    setState(() {
                      selectedPriority = value;
                    });
                  },
                ),
                Text("High"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 75),
                Column(
                  children: [
                    IconButton(
                      onPressed: _selectDate,
                      icon: Icon(Icons.calendar_month),
                    ),
                    selectedDate != null
                        ? Text("${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}")
                        : Text("Select date"),
                  ],
                ),
                SizedBox(width: 80),
                Column(
                  children: [
                    IconButton(
                      onPressed: _selectTime,
                      icon: Icon(Icons.watch_later_outlined),
                    ),
                    selectedTime != null
                        ? Text(selectedTime!.format(context))
                        : Text("Select time"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()
              {
                addTask();
                Navigator.push(context,MaterialPageRoute(builder: (context) => TaskTab()));
              },
              child: Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}