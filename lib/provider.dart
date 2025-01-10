import 'package:flutter/material.dart';

class ChangeManager extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  changeValue(value) {
    value = _value;
    notifyListeners();
  }
}
