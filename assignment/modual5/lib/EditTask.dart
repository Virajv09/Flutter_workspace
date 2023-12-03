import 'package:flutter/material.dart';

import 'Dbdart.dart';
import 'TaskTab.dart';


class EditTask extends StatefulWidget {
  final int id;
  EditTask({required this.id});

  @override
  EditTaskState createState() => EditTaskState();
}

class EditTaskState extends State<EditTask>
{

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController priority = TextEditingController();

  MyDb mydb = MyDb();

  @override
  void initState() {
    // TODO: implement initState
    mydb.open();

    Future.delayed(Duration(milliseconds: 500),()async
    {

      var data = await mydb.getTask(widget.id);
      if(data != null)
      {
        //name, description, date, time, priority
        name.text = data["name"];
        description.text = data["description"];
        date.text = data["date"];
        time.text = data["time"];
        priority.text = data["priority"];
        setState(() {});

      }
      else
      {
        print("No any data with roll no: " + widget.id.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Task Name",
              ),
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            TextField(
              controller: date,
              decoration: InputDecoration(
                hintText: "Date",
              ),
            ),
            TextField(
              controller: time,
              decoration: InputDecoration(
                hintText: "Time",
              ),
            ),
            TextField(
              controller: priority,
              decoration: InputDecoration(
                hintText: "Priority",
              ),
            ),
            ElevatedButton(
              onPressed: () async {

                mydb.db.rawUpdate("Update Task set name =? ,description=? , date=? ,time=? , priority=? where id=?",
                    [name.text, description.text, date.text, time.text, priority.text,widget.id]);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Updated")));
                Navigator.push(context,MaterialPageRoute(builder: (context) => TaskTab()));

              },
              child: Text("Save Task Data"),
            ),
          ],
        ),
      ),
    );
  }
}