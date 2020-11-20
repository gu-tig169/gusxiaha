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
        leading: Checkbox(
          value: todo.isdone,
          onChanged: (bool newvalue) {
            var state = Provider.of<MyState>(context, listen: false);
            state.setStuffDone(todo, newvalue);
          },
        ),
        title: Text(todo.stuff),
        trailing: IconButton(
          icon: Icon(Icons.clear),
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
