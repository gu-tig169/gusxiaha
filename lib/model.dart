import 'package:flutter/material.dart';

class TodoInfo {
  String stuff;
  bool isdone;

  TodoInfo({this.stuff, this.isdone});
}

class MyState extends ChangeNotifier {
  List<TodoInfo> _list = [];

  List<TodoInfo> get list => _list;

  void addStuff(TodoInfo stuff) {
    _list.add(stuff);
    notifyListeners();
  }

  void removeStuff(TodoInfo stuff) {
    _list.remove(stuff);
    notifyListeners();
  }
}
