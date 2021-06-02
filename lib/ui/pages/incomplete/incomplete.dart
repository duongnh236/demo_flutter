import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InComplete extends StatefulWidget {
  InComplete({this.isInComplete});
  final bool isInComplete;
  @override
  _InCompleteState createState() => _InCompleteState();
}

class _InCompleteState extends State<InComplete> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CheckboxListTile(
        title:  Text('InComplete'),
        value: widget.isInComplete ?? false,
        onChanged: (bool value) {
          // viewModel.checked(value: value, key: key);
        },
      ),
    );
  }
}
