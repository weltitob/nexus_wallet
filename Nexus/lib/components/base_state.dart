import 'package:flutter/material.dart';

//iwie sobald man es moved gibts errors die sich nicht durch n import fixen lassen
//was da abgeht noch abchecken
class BaseState extends ChangeNotifier {
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}