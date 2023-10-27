import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_july_new/storages/sqflite_ex/sqflite_crud/sql_functions.dart';

void main(){
  runApp(MaterialApp(home: Contact_Book(),));
}
class Contact_Book extends StatefulWidget {
  @override
  State<Contact_Book> createState() => _Contact_BookState();
}

class _Contact_BookState extends State<Contact_Book> {
  List<Map<String, dynamic>> contacts = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyContacts"),
      ),
      body: isLoading
          ? Text(
              "Create New Contact +",
              style: GoogleFonts.caesarDressing(fontSize: 25),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: const Icon(Icons.person),
                    ),
                    title: Text(contacts[index]['cname']),
                    subtitle: Text(contacts[index]['cnumber']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () => showSheet(contacts[index]['id']),
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () =>
                                deleteContact(contacts[index]['id']),
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: const Icon(Icons.person_add_alt_1_outlined),
      ),
    );
  }

  final name_controller = TextEditingController();
  final num_controller = TextEditingController();

  void showSheet(int? id) {
    if (id != null) {
      final existingcontact =
          contacts.firstWhere((element) => element['id'] == id);
      name_controller.text = existingcontact['cname'];
      num_controller.text = existingcontact['cnumber'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                SizedBox(height:20),
                TextField(
                  controller: num_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Number"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        createContact(name_controller.text, num_controller.text);
                      }
                      if (id != null) {
                        updateContact(id);
                      }
                      name_controller.text = "";
                      num_controller.text = "";
                      Navigator.of(context).pop();
                    },
                    child:
                    Text(id == null ? "Create Contact" : "Update Contact"))
              ],
            ),
          );
        });
  }

  Future<void> createContact(String name, String number) async {
    await SQL_Functions.addnewContact(name, number);
    readContact_and_refresh_Ui();
  }

  @override
  void initState() {
    readContact_and_refresh_Ui();
    super.initState();
  }

  Future<void> readContact_and_refresh_Ui() async {
    final mycontactss = await SQL_Functions.readContacts();
    setState(() {
      contacts = mycontactss;
      isLoading = false;
    });
  }

  Future<void> updateContact(int id) async {
    await SQL_Functions.updateContactt(
        id, name_controller.text, num_controller.text);
    readContact_and_refresh_Ui(); // to update the list after updating contact
  }

  Future<void> deleteContact(int id) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete Contact ?'),
        content: const Text('Do You want to delete the contact!!!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await SQL_Functions.removeContact(id);
              readContact_and_refresh_Ui();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("SuccessFully Deleted")));
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
