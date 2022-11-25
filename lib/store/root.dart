import 'package:flutter/material.dart';

class RootStore with ChangeNotifier {
  Locale _currLocale = const Locale('zh', '');

  String _alertTitle = '';

  Locale get currLocale => _currLocale;
  String get alertTitle => _alertTitle;

  void setLocale(String lang) {
    _currLocale = Locale(lang, '');
    notifyListeners();
  }

  void setAlertTitle(String title) {
    _alertTitle = title;
    notifyListeners();
  }
}