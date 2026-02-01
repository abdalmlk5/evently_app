import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  int selectedTab = 0;

  void changeSelectedTab(int newIndex) {
    if (selectedTab == newIndex) {
      return;
    }
    selectedTab = newIndex;
    notifyListeners();
  }
}
