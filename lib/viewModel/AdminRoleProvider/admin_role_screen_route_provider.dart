import 'package:flutter/material.dart';

class AdminRoleScreenRouteProvider extends ChangeNotifier {
  int _screenRouteIndex = 0;
  int get screenRouteIndex => _screenRouteIndex;

  /// set screen route index
  void setScreenRouteIndex(index) {
    _screenRouteIndex = index;
    notifyListeners();
  }
}
