import 'package:hive/hive.dart';
import 'package:project_july_new/storages/hive_ex/hive_using_typeadapter/model/users.dart';

/// singleton class (created using factory constructor, it have only single instance
///  factory constructor return this instance)

class HiveDB {
  HiveDB._internal(); // named constructor

  static HiveDB instance = HiveDB._internal(); // object creation

  //factory constructor
  factory HiveDB() {
    return instance;
  }

  Future<List<Users>> getUsers() async {
    final db = await Hive.openBox<Users>('users');
    return db.values.toList();
  }

  Future<void> addUser(Users user) async {
    final db = await Hive.openBox<Users>('users');
    db.put(user.id, user); // add email name and password to hive
  }
}
