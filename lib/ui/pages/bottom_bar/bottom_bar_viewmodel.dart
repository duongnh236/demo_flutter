import 'package:stacked/stacked.dart';

class BottomBarViewModel extends BaseViewModel {
  int indexSelected = 0;
  bool isComplete = false;
  bool isInComplete = false;

  void changeIndexSelected({int index}) {
    indexSelected = index;
    notifyListeners();
  }

  void handleData({Map<String, dynamic> data}) {
    isComplete = data['Complete'];
    isInComplete = data['InComplete'];
  }

}