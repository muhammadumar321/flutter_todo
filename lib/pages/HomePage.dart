import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_teal/utils/Dialog_Box.dart';
import 'package:todo_teal/utils/ToDo_tile.dart';

import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final myBoxHive = Hive.box("MyTodoBox");
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (myBoxHive.get("TODOLIST") == null) {
      db.createInitDbList();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void deleteFunction(int index) {
    setState(() {
      db.toDoList.remove(index);
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          saveCallBack: saveTask,
          cancelCallBack: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Todo",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0x333333),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Task",
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFFF5F5F5),
        shape: const CircleBorder(),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            isTaskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (value) => deleteFunction(index),
          );
        },
      ),
    );
  }
}
