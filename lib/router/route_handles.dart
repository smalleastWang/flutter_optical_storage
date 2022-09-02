import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/main.dart';
import 'package:flutter_optical_storage/router/public.dart';

//空页面
final emptyHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const EmptyPage());

// 首页-电站-告警-我的
final homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const IndexPage());

// 我的-登录-关于-修改密码
final loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const LoginPage());
final aboutHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const AboutPage());
final changePasswordHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const ChangePasswordPage());