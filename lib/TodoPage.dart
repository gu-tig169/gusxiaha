import 'package:flutter/material.dart';
import './model.dart';

class TodoPageView extends StatefulWidget {
  final TodoInfo stuff;

  TodoPageView(this.stuff);

  @override
  State<StatefulWidget> createState() {
    return TodoPageViewState(stuff);
  }
}

class TodoPageViewState extends State<TodoPageView> {
  String stuff;
  bool isdone;

  TextEditingController textEditingController;

  TodoPageViewState(TodoInfo todo) {
    this.stuff = todo.stuff;
    this.isdone = todo.isdone;

    textEditingController = TextEditingController(text: todo.stuff);

    textEditingController.addListener(() {
      setState(() {
        stuff = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo page'),
        /*
      actions: [
        FlatButton(
          child: Text('Save', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context, TodoInfo(stuff: stuff, isdone: false));
          },
        )
      ]
      */
      ),
      //body: SingleChildScrollView(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TodoInfoWidget(TodoInfo(stuff: this.stuff, isdone: this.isdone)),
              //TextField(controller: textEditingController),

              TextField(
                maxLength: 60,
                maxLengthEnforced: true,
                controller: textEditingController,
                decoration: InputDecoration(
                  //12-03
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent)),

                  //icon: Icon(Icons.add_to_home_screen),
                  labelText: "add something",
                ),
                //autofocus: true,
              ),
              _buttonbar(), //A buttonbar
            ]),
      ),
    );
  }

  Widget _buttonbar() {
    return Container(
        child: ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Ok'),
          color: Colors.blue,
          onPressed: () {
            //print(stuff);
            if (stuff != null && stuff != '') {
              Navigator.pop(context, TodoInfo(stuff: stuff, isdone: false));
            }
          },
        ),
        Container(
          width: 50,
        ),
        FlatButton(
          child: Text('Cancel'),
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
