import 'package:flutter/material.dart';
import './model.dart';
import 'TodoInfoWidget.dart';

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
      appBar: AppBar(title: Text('Todo page'), actions: [
        FlatButton(
          child: Text('Save', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context, TodoInfo(stuff: stuff, isdone: isdone));
          },
        )
      ]),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TodoInfoWidget(TodoInfo(stuff: this.stuff, isdone: this.isdone)),
          TextField(controller: textEditingController),
        ]),
      ),
    );
  }
}
