import 'package:flutter/material.dart';
import 'package:roome_ui/ui/explore_tab.dart';
import 'package:roome_ui/ui/profile_tab.dart';
import 'package:roome_ui/ui/trips_tab.dart';

class HomeModel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  get currentTab => tabs[_currentIndex];

  final tabs = [
    Center(
      child: Exploretab(),
    ),
    Center(
      child: Tripstab(),
    ),
    Center(
      child: Profiletab(),
    ),
  ];

  tabNavigationBar(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
