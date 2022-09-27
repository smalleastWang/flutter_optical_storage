import 'package:flutter/material.dart';

class PowerStationStore extends ChangeNotifier {
  int _currId = 0;

  int get currId => _currId;

  void setCurrId(int id) {
    _currId = id;
    notifyListeners();
  }

  void removeAll() {
    _currId = 0;
    notifyListeners();
  }
}