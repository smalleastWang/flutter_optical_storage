import 'package:flutter/material.dart';

class KeyValModal {
  String key = '';
  String? val = '';
  Widget? widgetVal;

  KeyValModal({required this.key, this.val, this.widgetVal});

  KeyValModal.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    val = json['val'];
    widgetVal = json['widgetVal'];
  }
}