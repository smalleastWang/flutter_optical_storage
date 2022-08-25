import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/router/public.dart';

//空页面
final emptyHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const EmptyPage());

// 登录页
final loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const LoginPage());

// 首页
final homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const HomePage());

// 电站
final powerStationHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const PowerStationPage());

// 告警
final alertHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const AlertPage());



// 我的
final myHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const MyPage());
final aboutHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const AboutPage());
final changePasswordHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const ChangePasswordPage());