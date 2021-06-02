import 'package:fl_template/ui/pages/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/setup_locator.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  HomePage({this.outputData});
  final Function(Map<String, dynamic> data) outputData;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, HomeViewModel viewModel, _) {
        return Container(
          key: Key('HomePage'),
            alignment: Alignment.center,
            child: ListView(
                key: Key('listView'),
              shrinkWrap: true,
                children: viewModel.values.keys.map((String key) {
          return CheckboxListTile(

            title: Text(key),
            value: viewModel.values[key],
            onChanged: (bool value) {
              viewModel.checked(value: value, key: key);
              widget.outputData(viewModel.values);
            },
          );
        }).toList()));
      },
      viewModelBuilder: () => locator.get<HomeViewModel>(),
      disposeViewModel: false,
    );
  }
}
