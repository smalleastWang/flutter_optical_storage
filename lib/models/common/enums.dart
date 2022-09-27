import 'package:flutter/material.dart';

class EnumsModel {
  String? title;
  dynamic value;
  Color? color;

  EnumsModel({this.title, this.value, this.color});

  EnumsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    value = json['color'];
  }
}