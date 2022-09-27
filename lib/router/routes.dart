import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/route_handles.dart';

class Routes {
  static String login = '/';
  static String home = "/home";

  static String powerStation = "/power-station";
  static String powerStationDetail = "/power-station/detail";
  static String powerStationDetailDeviceInfo = "/power-station/detail/device-info";

  static String alert = '/alert';

  static String my = '/my';
  static String about = '/about';
  static String changePassword = '/change-password';

  static void configureRoutes(FluroRouter router) {
    
    router.notFoundHandler = emptyHandler;


    router.define(home, handler: homeHandler);
    // 电站二级页面
    router.define(powerStationDetail, handler: powerStationDetailHandler);
    router.define(powerStationDetailDeviceInfo, handler: powerStationDetailDeviceInfoHandler);

    // 我的子页面
    router.define(login, handler: loginHandler);
    router.define(about, handler: aboutHandler);
    router.define(changePassword, handler: changePasswordHandler);
  }
}