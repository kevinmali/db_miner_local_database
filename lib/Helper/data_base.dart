import 'dart:developer';
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
          "CREATE TABLE IF NOT EXISTS category(id INTEGER PRIMARY KEY,quote TEXT NOT NULL)";
      await db.execute(query);
    });
  }

  Future<int?> insetcategory({
    required Category cat,
  }) async {
    await initdb();
    String query = "INSERT INTO category(id,quote) VALUES(?,?);";
    int res = await database!.rawInsert(query, [cat.id, cat.quote]);
    log("Inserted $res rows");
    return res;
  }

  Future<List<Category>> viewcategory() async {
    await initdb();
    String query = "SELECT * FROM  category";
    List<Map<String, dynamic>> data = await database!.rawQuery(query);
    log("$data");
    List<Category> alldata = data.map((e) => Category.sql(data: e)).toList();
    return alldata;
  }
}
