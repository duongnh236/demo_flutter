import 'package:fl_template/app/setup_locator.dart';
import 'package:fl_template/ui/pages/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModelMock extends Mock implements HomeViewModel {}

class NavigationServiceMock extends Mock implements NavigationService {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final NavigationServiceMock service = NavigationServiceMock();
  when(service.navigatorKey).thenReturn(new GlobalKey<NavigatorState>());
  locator.registerSingleton<NavigationService>(service);
  return service;
}

HomeViewModel getAndRegisterHomePageViewModelMock() {
  _removeRegistrationIfExists<HomeViewModel>();
  final HomeViewModel service = HomeViewModel();
  locator.registerSingleton<HomeViewModel>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterHomePageViewModelMock();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<HomeViewModel>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}