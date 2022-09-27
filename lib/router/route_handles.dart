import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/main.dart';
import 'package:flutter_optical_storage/router/public.dart';

//空页面
final emptyHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const EmptyPage());

// 首页-电站-告警-我的
final homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const IndexPage());
// 首页-电站-告警-我的
final powerStationDetailHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  int id = int.parse(params['id']?.first ?? '0');
  String name = params['name']?.first ?? '';
  int currentIndex = int.parse(params['currentIndex']?.first ?? '0');
  return PowerStationDetailPage(id: id, currentIndex: currentIndex, name: name);
});
// 设备详情
final powerStationDetailDeviceInfoHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  int id = int.parse(params['id']?.first ?? '0');
  String deviceId = params['deviceId']?.first ?? '0';
  int deviceType = int.parse(params['deviceType']?.first ?? '1');
  String name = params['name']?.first ?? '';
  String addr = params['addr']?.first ?? '';
  String loggerNum = params['loggerNum']?.first ?? '';
  return PowerDeviceDetailPage(id: id, name: name, addr: addr, loggerNum: loggerNum, deviceId: deviceId, deviceType: deviceType);
});



// 我的-登录-关于-修改密码
final loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const LoginPage());
final aboutHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const AboutPage());
final changePasswordHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const ChangePasswordPage());