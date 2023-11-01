import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    home: HiveTodo(),
  ));
}

class HiveTodo extends StatefulWidget {
  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String, dynamic>> task = []; /// to store values from hive
 
  ///hive object
  final my_box = Hive.box('todo_box');

  @override
  void initState() {
    readTask_refreshUi();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
      ),
      body: task.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(""),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(""),
                      Expanded(
                          child: Row(children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ]))
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertbox(null),
        child: Icon(Icons.task),
      ),
    );
  }

  final title_cntrl = TextEditingController();
  final descr_cntrl = TextEditingController();

  void showAlertbox(int? key) {
    // key is similar to id in sqflite
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                  controller: title_cntrl,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Content"),
                  controller: descr_cntrl,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title_cntrl.text != "" && descr_cntrl.text != "") {
                      createTeask({
                        'tname': title_cntrl.text.trim(),
                        'tcontent': descr_cntrl.text.trim()
                      });
                    }
                    title_cntrl.text = "";
                    descr_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text('Create Task')),
              TextButton(onPressed: () {}, child: Text('Update Task')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }
  

  Future<void> createTeask(Map<String, dynamic> mytask) async{
    await my_box.add(mytask);
  }

  void readTask_refreshUi() {}
  
  
}
