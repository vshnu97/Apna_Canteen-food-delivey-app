import 'package:flutter/cupertino.dart';

class AddButtonProv extends ChangeNotifier {
  int count = 1;
  bool isTrue = false;

  changeValue() {
    isTrue = true;
    notifyListeners();
  }

  changeValueRemmove() {
    isTrue = false;
    notifyListeners();
  }

  counterPlus() {
    count++;
    notifyListeners();
  }

  counterRem() {
    count--;
    notifyListeners();
  }
}
