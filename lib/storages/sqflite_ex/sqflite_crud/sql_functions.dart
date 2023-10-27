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
    await db.execute(
        'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, cname TEXT, cnumber TEXT)');
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

//to update a single value from
  static Future<int> updateContactt(int id, String name, String num) async {
    final db = await SQL_Functions.openDb();
    final updateddata = {
      'cname': name,
      'cnumber': num,
    };
    final updatedid = db.update('contact', updateddata, where: 'id=?', whereArgs: [id]);
    return updatedid;
  }

  static Future<void> removeContact(int id) async {
    final db = await SQL_Functions.openDb();
    try {
      await db.delete('contact', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      print('Something went wrong $e');
    }
  }
}
