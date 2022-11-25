// ignore: depend_on_referenced_packages
import 'package:amap_flutter_base/amap_flutter_base.dart';
class Const {
  //  static const baseUrl ='http://192.168.56.1:8080/hrlweibo/';
  static const baseUrl = 'https://solarweb.com.cn/SolarWeb/WeAppServlet';

  static const String assetsImg = 'assets/images/';

  static const bool isdebug = true;

  static const String spUser = 'sp_user';

  static const String spKeyboardHegiht = 'sp_keyboard_hegiht'; //软键盘高度

  static const int pageSize = 10;

  static String lang = ''; // 顶级组件加载是赋值

  static const AMapApiKey amapApiKeys = AMapApiKey(
    androidKey: 'c57d82a5b64a4a3f17c5495083d9bb72',
    iosKey: '91c5bad4b8f11ff33661ccbb06e93bc0'
  );

}