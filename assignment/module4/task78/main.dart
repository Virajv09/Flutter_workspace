import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> names = [];
  TextEditingController nameController = TextEditingController();
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter a name'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                final name = nameController.text;
                names.add(name);
                nameController.clear();
              });
            },
            child: Text('Add to ListView'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Selected Item'),
                          content: Text(names[index]),
                        );
                      },
                    );
                  },
                  onLongPress: () {
                    selectedItem = names[index];
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(0, 300, 0, 0),
                      items: <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Edit Item'),
                        ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Delete Item'),
                        ),
                        PopupMenuItem<String>(
                          value: 'exit',
                          child: Text('Exit'),
                        ),
                      ],
                    ).then((value) {
                      if (value == 'edit') {
                        // Edit item
                        nameController.text = selectedItem;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Edit Item'),
                              content: TextField(
                                controller: nameController,
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      names[index] = nameController.text;
                                    });
                                    nameController.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (value == 'delete') {
                        // Delete item
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Delete Item'),
                              content: Text('Are you sure you want to delete this item?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      names.removeAt(index);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}