import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('testBox');

  void exampleDatabase() {
    toDoList = [
      ["example_note", false],
    ];
  }

  void loadDatabase() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
