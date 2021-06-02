import 'package:fl_template/app/app_router.dart';
import 'package:fl_template/app/app_themes.dart';
import 'package:fl_template/app/setup_locator.dart';
import 'package:fl_template/generated/l10n.dart';
import 'package:fl_template/ui/pages/home/home_page.dart';
import 'package:fl_template/ui/pages/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_services/stacked_services.dart';
import '../test/setup/test_setup.dart';

void main() {
  HomeViewModel _homeViewModel;
  Widget _appWidget;

  group('HomeViewModel Test', () {
    setUp(() {
      registerServices();
      _homeViewModel = HomeViewModel();

      _appWidget = MaterialApp(
        title: 'Flutter Demo',
        darkTheme: darkTheme,
        // themeMode: themeMode,
        // theme: regularTheme,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: AppRoute.generateRoute,
        initialRoute: AppRoute.homeView,
        navigatorKey: locator<NavigationService>().navigatorKey,
      );
    });
      tearDown(() => unregisterServices());

      test('Test function check for Complete Todo ', () {
        final Map<String, dynamic> dataTest = <String, dynamic>{
          'Complete': true
        };
        _homeViewModel.checked(
            key: dataTest.keys.first, value: dataTest.values.first);

        expect(
            _homeViewModel.values[dataTest.keys.first], dataTest.values.first);
      });

      test('Test function uncheck for Complete Todo ', () {
        final Map<String, dynamic> dataTest = <String, dynamic>{
          'Complete': false
        };
        _homeViewModel.checked(
            key: dataTest.keys.first, value: dataTest.values.first);

        expect(
            _homeViewModel.values[dataTest.keys.first], dataTest.values.first);
      });


    test('Test function uncheck for InComplete Todo ', () {
      final Map<String, dynamic> dataTest = <String, dynamic>{
        'InComplete': false
      };
      _homeViewModel.checked(
          key: dataTest.keys.first, value: dataTest.values.first);

      expect(_homeViewModel.values[dataTest.keys.first], dataTest.values.first);
    });

    test('Test function check for InComplete Todo ', () {
      final Map<String, dynamic> dataTest = <String, dynamic>{
        'InComplete': true
      };
      _homeViewModel.checked(
          key: dataTest.keys.first, value: dataTest.values.first);

      expect(_homeViewModel.values[dataTest.keys.first], dataTest.values.first);
    });

  });
}
