import 'package:fl_template/app/app_router.dart';
import 'package:fl_template/app/app_themes.dart';
import 'package:fl_template/app/setup_locator.dart';
import 'package:fl_template/generated/l10n.dart';
import 'package:fl_template/ui/pages/bottom_bar/bottom_bar.dart';
import 'package:fl_template/ui/pages/bottom_bar/bottom_bar_viewmodel.dart';
import 'package:fl_template/ui/pages/complete/complete.dart';
import 'package:fl_template/ui/pages/home/home_page.dart';
import 'package:fl_template/ui/pages/incomplete/incomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_services/stacked_services.dart';
import '../test/setup/test_setup.dart';

void main() {
  BottomBarViewModel _bottomBarViewModel;
  Widget appWidget;
  group('BottomBar viewmodel test', () {
    setUp(() {
      registerServices();
      _bottomBarViewModel = BottomBarViewModel();

      appWidget = MaterialApp(
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
        initialRoute: AppRoute.bottomBarView,
        navigatorKey: locator<NavigationService>().navigatorKey,
      );
    });
    tearDown(() => unregisterServices());
    test('Test function changeIndexSelected', () {
      final int _indexSelectedMock = 0;
      _bottomBarViewModel.changeIndexSelected(index: _indexSelectedMock);
      expect(_bottomBarViewModel.indexSelected, _indexSelectedMock);
    });

    // Test widget
    testWidgets('Test BottomBarNavigaion', (WidgetTester tester) async {
      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();
      expect(find.byType(BottomBar), findsOneWidget);
      expect(find.byKey(Key('bottomBar')), findsOneWidget);
      expect(find.byKey(Key('Home')), findsOneWidget);
      expect(find.byKey(Key('InComplete')), findsOneWidget);
      expect(find.byKey(Key('Complete')), findsOneWidget);
    });

    testWidgets('Test taped HomePage in BottomNavigation Bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Home')));
      await tester.pumpAndSettle();
      // expect(find.byKey(key), matcher)
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Test taped InComplete in BottomNavigation Bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('InComplete')));
      await tester.pumpAndSettle();
      // expect(find.byKey(key), matcher)
      expect(find.byType(InComplete), findsOneWidget);
    });

    testWidgets('Test taped InComplete in BottomNavigation Bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Complete')));
      await tester.pumpAndSettle();
      // expect(find.byKey(key), matcher)
      expect(find.byType(Complete), findsOneWidget);
    });
  });
}
