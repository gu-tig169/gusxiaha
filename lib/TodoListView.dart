import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoList.dart';
import 'TodoPage.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My TodoList'),
        actions: <Widget>[
          // PopupMenu
          new PopupMenuButton<String>(
            offset: Offset(0, 100),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.selectView('All', 'A'),
              this.selectView('Done', 'B'),
              this.selectView('Undone', 'C'),
            ],
            onSelected: (String action) {
              switch (action) {
                case 'A':
                  var state = Provider.of<MyState>(context, listen: false);
                  state.setFilter('all');
                  //print(state.filter);
                  break;
                case 'B':
                  var state = Provider.of<MyState>(context, listen: false);
                  state.setFilter('done');
                  //print(state.filter);
                  break;
                case 'C':
                  var state = Provider.of<MyState>(context, listen: false);
                  state.setFilter('undone');
                  //print(state.filter);
                  break;
              }
            },
          ),
        ],
      ),
      body: Consumer<MyState>(builder: (context, state, child) {
        if (state.filter == '') {
          return TodoList(state.list);
        } else if (state.filter == 'all') {
          return TodoList(state.list);
        } else if (state.filter == 'done') {
          return TodoList(
              state.list.where((item) => item.isdone == true).toList());
        } else {
          return TodoList(
              state.list.where((item) => item.isdone == false).toList());
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newStuff = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TodoPageView(TodoInfo(stuff: 'what will you do'))));
          if (newStuff != null) {
            //add new todo to the list
            Provider.of<MyState>(context, listen: false).addStuff(newStuff);
          }
        },
      ),
    );
  }

  selectView(String text, String id) {
    return new PopupMenuItem<String>(
      value: id,
      child: Container(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text(text),
        ],
      )),
    );
  }
}
