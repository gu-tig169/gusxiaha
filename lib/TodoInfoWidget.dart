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
          Text('Is done: ' + stuff.isdone.toString()),
        ],
      ),
    );
  }
}
