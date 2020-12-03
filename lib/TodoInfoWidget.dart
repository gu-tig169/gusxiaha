import 'package:flutter/material.dart';

import 'model.dart';

class TodoInfoWidget extends StatelessWidget {
  final TodoInfo stuff;

  TodoInfoWidget(this.stuff);

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text('Title: ' + stuff.stuff),
          _setText(),
        ],
      ),
    );
  }

  Widget _setText() {
    if (stuff.isdone == false) {
      return Text('Status: Not Done.');
    } else {
      return Text('Status: Done.');
    }
  }
}
