import 'package:fl_template/ui/pages/base/screen_widget.dart';
import 'package:flutter/material.dart';

class AppBarPadding extends StatelessWidget {
  const AppBarPadding({Key key, this.child, this.backgroundColor})
      : super(key: key);

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      isShowBackground: false,
      backgroundColor: backgroundColor ?? Colors.white,
      body: child ?? Container(),
    );
  }
}
