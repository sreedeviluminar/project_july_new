import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class Users {

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  String? id;

  @HiveField(4)
  int? phone;

    Users({this.name,required this.email, required this.password,this.phone}){
      id = DateTime.now().microsecondsSinceEpoch.toString();
    }
}
