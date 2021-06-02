import 'package:fl_template/ui/pages/bottom_bar/bottom_bar_viewmodel.dart';
import 'package:fl_template/ui/pages/complete/complete.dart';
import 'package:fl_template/ui/pages/incomplete/incomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home/home_page.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{

  Widget _getBodyW({int index, BottomBarViewModel viewModel}) {
    switch(index) {
      case 0:
        return HomePage(outputData: (Map<String, dynamic> value) {
          viewModel.handleData(data: value);
        },);
        break;
      case 1:
        return InComplete(isInComplete: viewModel.isInComplete,);
        break;
      case 2:
        return Complete(isComplete: viewModel.isComplete,);
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
        builder: (BuildContext context, BottomBarViewModel viewModel, _) {
          return Scaffold(
            body: _getBodyW(index: viewModel.indexSelected, viewModel: viewModel),
            bottomNavigationBar: BottomNavigationBar(
              key: Key('bottomBar'),
              type: BottomNavigationBarType.fixed,
              currentIndex: viewModel.indexSelected,
              items: [
                BottomNavigationBarItem(
                  icon: Container(),
                  title: Text("Home", key: Key('Home'),),
                ),
                BottomNavigationBarItem(
                  icon: Container(),
                  title: Text("InComplete", key: Key('InComplete')),
                ),
                BottomNavigationBarItem(
                  icon: Container(),
                  title: Text("Complete", key: Key('Complete')),
                )
              ],
              onTap: (int index) {
                viewModel.changeIndexSelected(index: index);
              },
            ),
          );
        },
        viewModelBuilder: ()=> BottomBarViewModel());
  }
}
