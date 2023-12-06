import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/Model/database_model.dart';

class DB_helper {
  DB_helper._();

  static final DB_helper db = DB_helper._();
  static Database? database;

  Future initdb() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'quotes.db');
    database =
        await openDatabase(path, version: 1, onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS category(id INTEGER PRIMARY KEY,name TEXT)";
      await db.execute(query);
    });
  }

  Future<int> insetcategory({required category data}) async {
    await initdb();
    String query = "INSERT INTO category(name) VALUES(?)";
    List args = [data.quote];
    int? res = await database?.rawInsert(query, args);
    return res!;
  }

  Future<List<category>> viewcategory() async {
    await initdb();
    String query = "SELECT * FROM  category";
    List<Map<String, dynamic>> data = await database!.rawQuery(query);

    List<category> alldata = data.map((e) => category.sql(data: e)).toList();
    return alldata;
  }
}
