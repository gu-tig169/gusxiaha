import 'package:flutter/material.dart';

import 'model.dart';

class TodoInfoWidget extends StatelessWidget {
  final TodoInfo stuff;

  TodoInfoWidget(this.stuff);

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //decoration: BoxDecoration(color: card.color),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(child: Text(stuff.stuff)),
      ),
    );
  }
}
