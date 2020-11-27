import 'package:flutter/material.dart';
import 'apitodo.dart';

class TodoInfo {
  String todoId;
  String stuff;
  bool isdone;

  TodoInfo({this.todoId, this.stuff, this.isdone = false});

  static TodoInfo fromJSON(Map<String, dynamic> json) {
    return TodoInfo(
      todoId: json['id'],
      stuff: json['title'],
      isdone: json['done'],
    );
  }

  static Map<String, dynamic> toJSON(TodoInfo todo) {
    return {
      'title': todo.stuff,
      'done': todo.isdone,
    };
  }
}

class MyState extends ChangeNotifier {
  List<TodoInfo> _list = [];

  List<TodoInfo> get list => _list;

  String filter = '';

  void addStuff(TodoInfo stuff) async {
    //_list.add(stuff);
    //notifyListeners();
    await APITodo.addTodo(stuff);
    await getList();
  }

  void removeStuff(TodoInfo stuff) async {
    //_list.remove(stuff);
    //notifyListeners();
    await APITodo.deleteTodo(stuff.todoId);
    await getList();
  }

  void setStuffDone(TodoInfo stuff, bool done) async {
    stuff.isdone = done;
    await APITodo.updateTodo(stuff);
    await getList();

    //notifyListeners();
  }

  void setFilter(String filter) {
    this.filter = filter;
    notifyListeners();
  }

  //get the list from internet JSON file.
  Future getList() async {
    List<TodoInfo> list = await APITodo.fetchTodoList();
    _list = list;
    notifyListeners();
  }

  //return a List<TodoInfo> List with filter
  List<TodoInfo> getListByFilter() {
    List<TodoInfo> listFilter = [];
    if (filter == 'done') {
      listFilter = _list.where((item) => item.isdone == true).toList();
    } else if (filter == 'undone') {
      listFilter = _list.where((item) => item.isdone == false).toList();
    } else {
      listFilter = _list;
    }
    return listFilter;
  }
}
