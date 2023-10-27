import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class SQL_Functions {
  //create database
  static Future<sql.Database> openDb() async {
    return sql.openDatabase('mycontacts', version: 1,
        onCreate: (sql.Database db, int version) async {
      await createTable(db);
    });
  }

  //create Table
  static Future<void> createTable(sql.Database db) async {
    await db.execute('CREATE TABLE contact (id INTEGER PRIMARY KEY AUTO INCREMENT NOT NULL, cname TEXT, cnumber TEXT)');
  }

  //insert new data to db
  static Future<int> addnewContact(String name, String number) async {
    final db = await SQL_Functions.openDb(); // database open
    final data = {"cname": name, "cnumber": number};
    final id = await db.insert('contact', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

// read all the data from db
  static Future<List<Map<String, dynamic>>> readContacts() async {
    final db = await SQL_Functions.openDb();
    return db.query('contact', orderBy: 'id');
  }
}
