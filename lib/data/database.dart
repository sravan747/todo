// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class tododatabase {
  List todolist = [];
  final _mybox = Hive.box('mybox');

  void createinitial() {
    todolist = [
      ['Review This App', false],
      ['Share This App', false],
    ];
    updatedatabase(); // 
  }

  void loaddata() {
    todolist = _mybox.get('TODOLIST') ?? []; // ✅ FIXED
  }

  void updatedatabase() {
    _mybox.put('TODOLIST', todolist);
  }
}