import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomProvider =
    ChangeNotifierProvider((_) => BottomNavbarmodel());

class BottomNavbarmodel extends ChangeNotifier {
  int? _currentIndex = 0;
  int? get currentIndex => _currentIndex;

  final PageController _pageController = PageController();
  get pageController => _pageController;

  void updateCurrentIndex(int index) {
    _currentIndex = index;

    notifyListeners();
  }

  int? fetchCurrentScreenIndex() {
    return currentIndex;
  }
}
