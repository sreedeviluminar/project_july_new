import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              itemCount: task.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                int date =DateTime.fromMillisecondsSinceEpoch(task[index]['time']) as int;

                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${task[index]['taskname']}',
                        style: GoogleFonts.habibi(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(task[index]['taskdesc'],
                          overflow: TextOverflow.visible,
                          maxLines: 4,
                          style: GoogleFonts.habibi(fontSize: 15)),
                      Text('${date}',
                          style: GoogleFonts.habibi(fontSize: 15)),
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            IconButton(
                                onPressed: () =>
                                    showAlertbox(task[index]['id']),
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => deleteTask(task[index]['id']),
                                icon: const Icon(Icons.delete)),
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
    // key  -> task[index]['id']
    // key is similar to id in sqflite
    if (key != null) {
      final existing_task = task.firstWhere((element) => element['id'] == key);
      title_cntrl.text = existing_task['taskname'];
      descr_cntrl.text = existing_task['taskdesc'];
    }
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
                  maxLines: 3,
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
                      createTask({
                        'tname': title_cntrl.text.trim(),
                        'tcontent': descr_cntrl.text.trim(),
                        'time': DateTime.now().microsecondsSinceEpoch.toString()

                      });
                    }
                    title_cntrl.text = "";
                    descr_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text('Create Task')),
              TextButton(
                  onPressed: () {
                    updateTask(key, {
                      'tname': title_cntrl.text.trim(),
                      'tcontent': descr_cntrl.text.trim(),
                      'time': DateTime.now().microsecondsSinceEpoch.toString()

                    });
                    title_cntrl.text = "";
                    descr_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: Text('Update Task')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> mytask) async {
    await my_box.add(mytask);
    readTask_refreshUi();

    ///refresh ui when ever we add delete or edit a task
  }

  ///read all the data from hive and assign it to the list 'task'
  void readTask_refreshUi() {
    final task_from_hive = my_box.keys.map((key) {
      /// fetch all  the keys from hive box

      final value = my_box.get(key); // single map corresponding to the key
      return {
        'id': key,
        'taskname': value['tname'],
        'taskdesc': value['tcontent']
      };
    }).toList();

    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

  /// updating the hive task of a single key
  Future<void> updateTask(int? key, Map<String, dynamic> updatedTask) async {
    await my_box.put(key, updatedTask);
    readTask_refreshUi();
  }

  Future<void> deleteTask(int key) async {
    await my_box.delete(key);
    readTask_refreshUi();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Successfully Deleted")));
  }
}
