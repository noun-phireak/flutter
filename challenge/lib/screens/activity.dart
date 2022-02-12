import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
   String name;
  Activity({ Key? key, required this.name }) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}