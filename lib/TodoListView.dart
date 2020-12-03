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
              setFilterValue(action,
                  context); //set the filter value to the filter variable in class MyState.
            },
          ),
        ],
      ),
      body: Consumer<MyState>(builder: (context, state, child) {
        return TodoList(state
            .getListByFilter()); // return a list with filter depend on whcih filter you select on the PopupmentButton.
      }),
      floatingActionButton: _floatbutton(context),
    );
  }

  //This widget is for FloatingActionButton
  Widget _floatbutton(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newStuff = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TodoPageView(TodoInfo(stuff: null))));
          //I changed this row and do not send some text to the Add page.
          //TodoPageView(TodoInfo(stuff: 'what will you do'))));
          if (newStuff != null) {
            Provider.of<MyState>(context, listen: false)
                .addStuff(newStuff); //add new todo to the list
          }
        },
      ),
    );
  }

  // write e general metod fot the PopupMenuButton to set item.
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

//set the filter value to the filter variabel in the class MyState in model.dart.
// goal is to get different list with the filter value.
  setFilterValue(String filter, BuildContext context) {
    var state = Provider.of<MyState>(context, listen: false);
    switch (filter) {
      case 'A':
        state.setFilter('all');
        break;
      case 'B':
        state.setFilter('done');
        break;
      case 'C':
        state.setFilter('undone');
        //print(state.filter);
        break;
    }
  }
}
