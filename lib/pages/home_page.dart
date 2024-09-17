import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import "package:to_do_app/pages/databases/database.dart";
import "package:to_do_app/pages/utils/notes.dart";
import "package:to_do_app/pages/utils/task_dialog_box.dart";

// ignore: camel_case_types
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('testBox');
  final TextEditingController _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    if (_myBox.get("TODOLIST") == null) {
      db.exampleDatabase();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  void saveEntryTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Task_Dialog_Box(
            controller: _controller,
            onCheck: saveEntryTask,
            onClose: () => Navigator.of(context).pop(),
          );
        });
  }

  void toDoStateChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "TO DO APP",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade200,
              Colors.red.shade200,
              Colors.yellow.shade200,
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.star,
                  size: 300,
                  color: Colors.yellow,
                ),
              ),
            ),
            ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return Notes_list(
                  taskName: db.toDoList[index][0],
                  taskFinish: db.toDoList[index][1],
                  onChanged: (value) => toDoStateChanged(value, index),
                  removeTask: (context) => deleteTask(index),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
