import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {

  Map<String, bool> values = {
    'Complete': false,
    'InComplete': false,
  };

  void checked({bool value, String key}) {
    values.updateAll((key, value) => value = false);
    values[key] = value;
    notifyListeners();
  }
}
