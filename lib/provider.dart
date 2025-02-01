import 'package:flutter/material.dart';

class ChangeManager extends ChangeNotifier {
  String currentValue = 'Low';
  List<String> mainTitle = [];
  List<String> mainPriority = [];
  TextEditingController mycontroller = TextEditingController();

  final List<String> priorityList = ['Low', 'Medium', 'High'];
  

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

  deleteValue() {
    mainTitle.removeLast();
    notifyListeners();
  }
  

   updateMainTitle(int index, String newTitle) {
    if (index >= 0 && index < mainTitle.length) {
      mainTitle[index] = newTitle;
      notifyListeners();
    }
  }
}

