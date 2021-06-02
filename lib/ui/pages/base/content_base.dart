import 'package:fl_template/ui/pages/base/appbar_padding.dart';
import 'package:fl_template/ui/pages/base/content_base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:stacked/stacked.dart';

class ContentPage extends ViewModelBuilderWidget<ContentViewModel> {
  const ContentPage({@required this.body, Key key, this.customAppColor})
      : super(key: key);

  final Widget body;
  final Color customAppColor;
  @override
  bool get reactive => false;
  // After widget initialized.
  void onAfterBuild(BuildContext context) {}

  @override
  Widget builder(BuildContext context, ContentViewModel model, Widget child) {
    ScreenUtil.init(context, designSize: const Size(375, 667));
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white),
        ),
        body: AppBarPadding(
          backgroundColor: Colors.white,
          child: SafeArea(
            top: false,
            child: body,
          ),
        ),
      ),
    );
  }

  @override
  ContentViewModel viewModelBuilder(BuildContext context) {
    return ContentViewModel();
  }
  @override
  void onViewModelReady(ContentViewModel model) {
    super.onViewModelReady(model);
  }

}

