import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_page createState() => _home_page();
}

class _home_page extends State<home_page> {
  // text controller

  final _controller = TextEditingController();

  // list of todo tasks
  List<List<dynamic>> toDoList = [
    ["task 01", false],
    ["task 02", false],
  ];

  // checkbox was changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save a task 

  void saveNewTask () {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear(); 
    });
    Navigator.of(context).pop();
  }

  //create a new task 

  void createNewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}

  //delete task

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('ToDo'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (contect) => deleteTask(index),
          );
        },
      ),
    );
  }
}
