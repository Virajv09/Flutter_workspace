import 'package:flutter/material.dart';
import 'Dbdart.dart';
import 'EditTask.dart';

class TaskTab extends StatefulWidget {
  @override
  TaskTabState createState() => TaskTabState();
}

class TaskTabState extends State<TaskTab> {
  List<Map>? slist; // Make slist nullable
  MyDb mydb = MyDb();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mydb.open().then((_) {
      getData();
    });
  }

  Color getPriorityColor(String priority) {
    if (priority == "high") {
      return Colors.red;
    } else if (priority == "medium") {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Tasks")),
      body: Column(
        children: [
          SizedBox(height: 30,),
          SearchBar(
            controller:searchController ,
            //searchController: searchController,
            onChanged: filterTasks,
            leading: Icon(Icons.search,),
          ),
          Expanded(
            child: slist == null
                ? Center(child: CircularProgressIndicator())
                : slist!.isEmpty
                ? Center(child: Text("No Tasks here.."))
                : ListView.builder(
              itemCount: slist!.length,
              itemBuilder: (BuildContext context, int index) {
                final stuone = slist![index];
                String priority = stuone["priority"] ?? "N/A";
                Color bgColor = getPriorityColor(priority);

                final isCompleted = stuone["completed"] == 1;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.all(10),
                  color: isCompleted ? Colors.grey : bgColor,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.task, color: Colors.black),
                        title: Text(
                          "Task: ${stuone["name"] ?? "N/A"}",
                          style: TextStyle(
                            fontSize: 18,
                            decoration: isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(
                          "Description: ${stuone["description"] ?? "N/A"}",
                          style: TextStyle(
                            fontSize: 16,
                            decoration: isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month, color: Colors.black),
                              Text(stuone["date"] ?? "N/A"),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined, color: Colors.black),
                              Text(stuone["time"] ?? "N/A"),
                            ],
                          ),
                          SizedBox(width: 30),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                                return EditTask(id: stuone["id"]);
                              }));
                            },
                            icon: Icon(Icons.edit, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              mydb.db.rawDelete("DELETE FROM Task where id = ?", [stuone["id"]]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Task DELETED")));
                              getData();
                            },
                            icon: Icon(Icons.delete, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              mydb.db.rawUpdate(
                                'UPDATE Task SET completed = ? WHERE id = ?',
                                [1, stuone["id"]],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Task Completed")));
                              getData();
                            },
                            icon: Icon(Icons.check, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getData() async {
    slist = await mydb.db.rawQuery('SELECT * FROM Task ORDER BY date');
    setState(() {});
  }

  void filterTasks(String query) {
    if (query.isEmpty) {
      getData(); // If the search query is empty, show all tasks
    } else {
      List<Map> filteredList = slist!
          .where((task) =>
      task["name"]!.toLowerCase().contains(query.toLowerCase()) ||
          task["date"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        slist = filteredList;
      });
    }
  }
}