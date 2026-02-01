import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  int selectedCategory = 0;

  void changeSelectedCategory(int newIndex) {
    if (selectedCategory == newIndex) {
      return;
    }
    selectedCategory = newIndex;
    notifyListeners();
  }
}
