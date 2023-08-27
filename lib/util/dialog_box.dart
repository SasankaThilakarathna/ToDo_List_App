import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    Key? key, 
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user inputs
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add A New Task",
              ),
              // style: TextStyle(color: Colors.white),
            ),

            // buttons (save & cancel)

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
                const SizedBox(width:8.0),
                 // save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
