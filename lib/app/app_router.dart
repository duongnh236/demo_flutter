
import 'package:fl_template/ui/pages/bottom_bar/bottom_bar.dart';
import 'package:fl_template/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const splashView = '/';
  static const homeView = '/home';
  static const bottomBarView = '/bottom_bar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case bottomBarView:
        return MaterialPageRoute(builder: (_) => BottomBar());
      case homeView:
        return MaterialPageRoute(builder: (_) => HomePage());
      // default:
      //   return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}