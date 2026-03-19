// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utilities/dialogbox.dart';
import 'package:todo/utilities/todolist.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  late Box _mybox; // ✅ FIXED

  tododatabase db = tododatabase();

  @override
  void initState() {
    super.initState();
    _mybox = Hive.box('mybox'); // ✅ FIXED

    if (_mybox.get('TODOLIST') == null) {
      db.createinitial();
    } else {
      db.loaddata();
    }
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedatabase();
  }

  void savetask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialogbox(
          controller: _controller,
          onsave: savetask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('To-do')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
        focusColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return todotitle(
            taskName: db.todolist[index][0],
            taskcompleted: db.todolist[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deletefunction: (context) => deletetask(index), // ✅ FIXED
          );
        },
      ),
    );
  }
}