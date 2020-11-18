import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoList.dart';
import 'TodoPage.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My TodoList')),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newStuff = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TodoPageView(TodoInfo(stuff: 'what will you do'))));
          if (newStuff != null) {
            // Lägg till newCard i listan av julkort.
            Provider.of<MyState>(context, listen: false).addStuff(newStuff);
          }
        },
      ),
    );
  }
}
