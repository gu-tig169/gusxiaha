import 'package:flutter/material.dart';

class TodoInfo {
  String stuff;
  bool isdone;

  TodoInfo({this.stuff, this.isdone = false});
}

class MyState extends ChangeNotifier {
  List<TodoInfo> _list = [];

  List<TodoInfo> get list => _list;

  String filter = '';

  void addStuff(TodoInfo stuff) {
    _list.add(stuff);
    notifyListeners();
  }

  void removeStuff(TodoInfo stuff) {
    _list.remove(stuff);
    notifyListeners();
  }

  void setStuffDone(TodoInfo stuff, bool done) {
    stuff.isdone = done;
    notifyListeners();
  }

  void setFilter(String filter) {
    this.filter = filter;
    notifyListeners();
  }
}
