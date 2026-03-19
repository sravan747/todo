import 'package:hive/hive.dart';

class tododatabase {
  List todolist = [];
  final _mybox = Hive.box('mybox');

  void createinitial() {
    todolist = [
      ['Review This App', false],
      ['Share This App', false],
    ];
  }

  void loaddata() {
    todolist = _mybox.get('TODOLIST');
  }

  void updatedatabase() {
    _mybox.put('TODOLIST', todolist);
  }
}
