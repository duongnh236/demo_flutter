import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  Complete({this.isComplete});
  final bool isComplete;
  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CheckboxListTile(
        title:  Text('Complete'),
        value: widget.isComplete ?? false,
        onChanged: (bool value) {
          // viewModel.checked(value: value, key: key);
        },
      ),
    );
  }
}
