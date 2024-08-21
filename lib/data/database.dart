import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoDataBase {
  List toDoList = [];

  final myBoxHive = Hive.box("MyTodoBox");

  void createInitDbList() {
    toDoList = [
      ["First", false],
      ["second", false],
    ];
  }

  void loadData() {
    toDoList = myBoxHive.get("TODOLIST");
  }

  void updateData() {
    myBoxHive.put("TODOLIST", toDoList);
  }
}
