import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> items = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Context Menu'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (choice) {
                handleMenuChoice(choice, index);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem<String>(
                    value: 'view',
                    child: Text('View'),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),

                ];
              },
            ),
          );
        },
      ),
    );
  }

  void handleMenuChoice(String choice, int index) {
    switch (choice) {
      case 'edit':
      // Handle edit operation
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit Item'),
              content: Text('Editing ${items[index]}'),
            );
          },
        );
        break;
      case 'view':
      // Handle view operation
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('View Item'),
              content: Text('Viewing ${items[index]}'),
            );
          },
        );
        break;
      case 'delete':
      // Handle delete operation
        setState(() {
          items.removeAt(index);
        });
        break;
    }
  }
}