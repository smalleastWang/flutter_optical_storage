import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/route_handles.dart';
import 'package:flutter_optical_storage/utils/sp_util.dart';

class Routes {
  static String login = '/';
  static String home = "/home";

  static String powerStation = "/power-station";

  static String alert = '/alert';

  static String my = '/my';
  static String about = '/about';
  static String changePassword = '/change-password';

  static void configureRoutes(FluroRouter router) {
    
    router.notFoundHandler = emptyHandler;

    router.define(login, handler: loginHandler);

    router.define(home, handler: homeHandler);

    // router.define(powerStation, handler: powerStationHandler);

    // router.define(alert, handler: alertHandler);

    // router.define(my, handler: myHandler);
    router.define(about, handler: aboutHandler);
    router.define(changePassword, handler: changePasswordHandler);
  }
}