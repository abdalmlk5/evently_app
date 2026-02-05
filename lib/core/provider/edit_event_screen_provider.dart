import 'package:flutter/material.dart';

class EditEventScreenProvider extends ChangeNotifier {
  int selectedCategory;

  EditEventScreenProvider({required this.selectedCategory});

  void changeSelectedCategory(int newIndex) {
    if (selectedCategory == newIndex) {
      return;
    }
    selectedCategory = newIndex;
    notifyListeners();
  }
}
