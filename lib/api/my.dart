

import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/login_model.dart';
import 'package:flutter_optical_storage/models/api/user_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApi {
  // 登录接口
  static Future<LoginDatModel> fetchLoginApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'login'};
    query.addAll(params);
    Map<String, dynamic> resMap = await CommonApi().request(query: query);
    LoginModel res = LoginModel.fromJson(resMap);
    if (res.err == 23) {
      Fluttertoast.showToast(msg: '帐号被锁定');
      throw Exception('帐号被锁定');
    }
    if (res.err == 8) {
      Fluttertoast.showToast(msg: '用户名或密码错误');
      throw Exception('用户名或密码错误');
    }
    if (res.err == 2) {
      Fluttertoast.showToast(msg: '帐号不存在');
      throw Exception('帐号不存在');
    }
    if (res.err != 0) {
      Fluttertoast.showToast(msg: '请求错误, 错误码${res.err}');
      throw Exception('请求错误, 错误码${res.err}');
    }
    return res.dat!;
  }

  // 修改密码接口
  static Future<void> fetchChangePwdApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'mdpwd'};
    query.addAll(params);
    Map<String, dynamic> res = await CommonApi().request(query: query);
    if (res['err'] == 11) {
      Fluttertoast.showToast(msg: '原密码错误');
      throw Exception('帐号不存在');
    }
    if (res['err'] == 8) {
      Fluttertoast.showToast(msg: '没有修改密码权限');
      throw Exception('没有修改密码权限');
    }
    if (res['err'] != 0) {
      Fluttertoast.showToast(msg: '请求错误, 错误码${res['err']}');
      throw Exception('请求错误, 错误码${res['err']}');
    }
  }

  // 获取版本
  static Future<String?> fetchVersionApi() async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'version'};
    Map<String, dynamic> res = await CommonApi().request(query: query);
    if (res['err'] != 0) {
      Fluttertoast.showToast(msg: '版本获取失败');
      throw Exception('请求错误, 错误码${res['err']}');
    }
    if (res['dat'] != null && res['dat']['solarmonitor'] != null) {
      return res['dat']['solarmonitor'] as String;
    }
    return null;
  }

  // 获取用户信息
  static Future<UserInfoModel> fetchUserInfoApi() async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'getUserInfo'};
    Map<String, dynamic> data = await CommonApi().request(query: query);
    return UserInfoModel.fromJson(data);
  }
}