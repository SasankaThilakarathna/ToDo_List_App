import 'package:flutter/material.dart';
import 'package:todo/screens/home_page.dart';

void main(){
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}