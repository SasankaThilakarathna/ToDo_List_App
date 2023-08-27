import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right:25.0, top:25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
              )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(20.0) ,
          decoration: BoxDecoration(
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
              value: taskCompleted, 
              onChanged:onChanged,
              activeColor: Colors.black),
              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted 
                  ? TextDecoration.lineThrough 
                  : TextDecoration.none,
                  color: Colors.white,
                  fontSize: 16.0, 
                  )),
            ],
          ),
        ),
      ),
    );
  } 
}