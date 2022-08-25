import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/route_handles.dart';

class Routes {
  static String login = '/login';
  static String home = "/";

  static String powerStation = "/power-station";

  static String alert = '/alert';

  static String my = '/my';
  static String about = '/about';
  static String changePassword = '/change-password';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = emptyHandler;

    router.define(login, handler: loginHandler);

    router.define(powerStation, handler: powerStationHandler);

    router.define(alert, handler: alertHandler);

    router.define(my, handler: myHandler);
    router.define(about, handler: aboutHandler);
    router.define(changePassword, handler: changePasswordHandler);
  }
}