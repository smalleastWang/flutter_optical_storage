import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application {
  static late FluroRouter router;

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic>? params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        if (params[key] is int) {
          params[key] = params[key].toString();
        }
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = "$query&";
        }
        query += "$key=$value";
        index++;
      }
    }
    // print('我是navigateTo传递的参数：$query');

    path = path + query;
    return router.navigateTo(context, path, transition: transition);
  }
}
