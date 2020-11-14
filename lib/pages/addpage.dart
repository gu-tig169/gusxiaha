import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // The first text field is focused on as soon as the app starts.
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.add_to_home_screen),
              labelText: "add a stuff",
            ),
            //autofocus: true,
          ),
          // The second text field is focused on when a user taps the
          // FloatingActionButton.
        ],
      ),
    );
  }
}
