import 'dart:convert';
import 'package:flutter_optical_storage/utils/sp_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service.dart';
import 'package:dio/dio.dart';
import 'service_manager.dart';

enum RequestMethod { get, post, put, delete, patch, copy }

class BaseApi {
  String serviceKey() {
    return "";
  }

  String path() {
    return "";
  }

  RequestMethod method() {
    return RequestMethod.get;
  }

  Future<T> request<T>(
      {Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      Map<String, dynamic>? header,
      Function? successCallBack,
      Function? errorCallBack}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    //获取到对应的服务
    Service service;
    if (ServiceManager().serviceMap.containsKey(serviceKey())) {
      service = ServiceManager().serviceMap[serviceKey()];
    } else {
      throw Exception('服务尚未注册');
    }
    Dio dio = service.dio;

    Response? response;
    Map<String, dynamic>? queryParams = {};
    var globalQueryParams = service.serviceQuery();
    // 添加 userId
    if (userId != null && userId.isNotEmpty) {
      queryParams.addAll({"userid": userId});
    }
    if (globalQueryParams != null) {
      queryParams.addAll(globalQueryParams);
    }
    if (query != null) {
      queryParams.addAll(query);
    }

    Map<String, dynamic>? headerParams = {};

    var globalHeaderParams = service.serviceHeader();
    if (globalHeaderParams != null) {
      headerParams.addAll(globalHeaderParams);
    }
    if (header != null) {
      headerParams.addAll(header);
    }

    Map<String, dynamic>? bodyParams = {};
    var globalBodyParams = service.serviceBody();
    if (globalBodyParams != null) {
      bodyParams.addAll(globalBodyParams);
    }
    if (body != null) {
      bodyParams.addAll(body);
    }

    String url = path();

    Options options = Options(headers: headerParams);

    try {
      switch (method()) {
        case RequestMethod.get:
          if (queryParams.isNotEmpty) {
            response = await dio.get(url,
                queryParameters: queryParams, options: options);
          } else {
            response = await dio.get(url, options: options);
          }
          break;
        case RequestMethod.post:
          if (body != null && body.isNotEmpty) {
            response = await dio.post(url, data: body, options: options);
          } else {
            response = await dio.post(url, options: options);
          }
          break;
        default:
      }
    } on DioError catch (error) {
      if (errorCallBack != null) {
        errorCallBack(service.errorFactory(error));
      }
      throw Exception(service.errorFactory(error));
    }
    if (response != null && response.data != null) {
      
      if (response.data == '') {
        if (T is List) {
          return json.decode(response.data ?? '[]');
        }
        if (T is Map) {
          return json.decode(response.data ?? '{}');
        }
        Fluttertoast.showToast(msg: 'system error');
        throw Exception('接口返回为空字符串');
      }
      if (response.data == null) {
        Fluttertoast.showToast(msg: 'system error');
        throw Exception('接口返回为null');
      }
      T data = json.decode(response.data);
      // dataMap = service.responseFactory(dataMap);
      if (successCallBack != null) {
        successCallBack(data);
      }
      return data;
    }
    Fluttertoast.showToast(msg: 'system error');
    throw Exception('接口返回为空');
  }
}
