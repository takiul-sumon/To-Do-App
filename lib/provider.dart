import 'package:flutter/material.dart';

class ChangeManager extends ChangeNotifier {
  String currentValue = 'Low';
  List<String> mainTitle = [];
  List<String> mainPriority = [];

  void updateValue(String title) {
    mainTitle.add(title);
    mainPriority.add(currentValue);
    notifyListeners();
    print(mainTitle);
    print(currentValue);
  }

  updateCurrentValue(String value) {
    currentValue = value;
    mainPriority.add(value);
    notifyListeners();
  }
}
