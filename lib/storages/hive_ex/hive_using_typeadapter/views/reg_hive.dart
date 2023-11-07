import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_july_new/storages/hive_ex/hive_using_typeadapter/model/users.dart';

import '../database/hivedb.dart';

class Hive_Reg extends StatelessWidget {
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final pwd_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Registration Page"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: name_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: email_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "User Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: pwd_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password"),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () async{
                  final userList = await HiveDB.instance.getUsers();
                  validateSignUp(userList);
                  name_controller.clear();
                  email_controller.clear();
                  pwd_controller.clear();
                },
                shape: const StadiumBorder(),
                color: Colors.pink,
                child: const Text('Register Here'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateSignUp(List<Users> userList) async {
    final name = name_controller.text.trim();
    final mail = email_controller.text.trim();
    final pswrd = pwd_controller.text.trim();
    bool userExist = false;

    final validateEmail = EmailValidator.validate(mail);
    if (name != "" && mail != "" && pswrd != "") {
      if (validateEmail == true) {
        await Future.forEach(userList, (user) {
          if (user.email == mail) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar("Error!", "User Already Exist!!!");
        } else {
          final validatePassword = checkPassword(pswrd);
          if(validatePassword == true){
            // if both email and password are valid user will added to hive
            final user = Users(email: mail, password: pswrd,name: name);
            await HiveDB.instance.addUser(user);
            Get.back(); // navigate to login
            Get.snackbar('Success', 'User Registration Success!!');
          }
        }
      }else{
        Get.snackbar("Error", "Enter a valid email!!");
      }
    }else{
      Get.snackbar("Error", "Please fill all the fields");
    }
  }
  bool checkPassword(String pswrd) {
    if(pswrd.length < 6){
      Get.snackbar("Error", "Password length must be > 6");
      return false;
    }else{
      return true;
    }
  }
}
