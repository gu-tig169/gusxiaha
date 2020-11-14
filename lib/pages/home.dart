import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
        //leading: new Icon(Icons.home),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print("FloatingActionButton"),
          child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // pop to Add page
                Navigator.pushNamed(
                  context,
                  '/details/',
                );
              }),
          tooltip: "Do not press long time",
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          // elevation: 6.0,
          // highlightElevation: 12.0,
          shape: CircleBorder()),
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
