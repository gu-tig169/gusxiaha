import 'package:flutter/material.dart';
import 'package:todosmart/TodoInfoWidget.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoInfo> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _todoItem(context, todo)).toList());
  }

  Widget _todoItem(context, todo) {
    return ListTile(
        leading: Container(
          height: 30,
          width: 30,
        ),
        title: Text(todo.stuff),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeStuff(todo);
          },
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodoView(todo)));
        });
  }
}

class TodoView extends StatelessWidget {
  final TodoInfo todo;
  TodoView(this.todo);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: TodoInfoWidget(todo)),
    );
  }
}
