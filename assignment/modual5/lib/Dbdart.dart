

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb
{

  late Database db;

  Future open() async
  {

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Task.db');
    print(path);
    db = await openDatabase(path,version: 1,onCreate:(Database db, int version) async
    {

      await db.execute('''
 CREATE TABLE IF NOT EXISTS Task(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(255) NOT NULL,
          description VARCHAR(255) NOT NULL,
          date VARCHAR(255) NOT NULL,
          time VARCHAR(255) NOT NULL,
          priority VARCHAR(255) NOT NULL,
          completed INTEGER NOT NULL
      );
      
    // Create more tables here if needed
''');



/*      await db.execute('''
    CREATE TABLE IF NOT EXISTS Task(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        date VARCHAR(255) NOT NULL,
        time VARCHAR(255) NOT NULL,
        priority VARCHAR(255) NOT NULL
    );
    // Create more tables here if needed
''');*/

      print("Table Created");
    });

  }

  Future<Map<dynamic, dynamic>?> getTask(int id) async {
    List<Map> maps = await db.query('Task',
        where: 'id = ?',
        whereArgs: [id]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }

}