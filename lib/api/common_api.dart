

import 'package:flutter_optical_storage/http/base_api.dart';
import 'package:flutter_optical_storage/service/custom_service.dart';

class CommonApi extends BaseApi {

  @override
  String path() {
    return "/SolarWeb/WeAppServlet";
  }

  @override
  RequestMethod method() {
    return RequestMethod.get;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}

class EnergyApi extends BaseApi {
  @override
  String path() {
    return "/SolarWeb/MonitorServlet";
  }

  @override
  RequestMethod method() {
    return RequestMethod.get;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}
class ConfigApi extends BaseApi {
  @override
  String path() {
    return "/SolarWeb/ConfigServlet";
  }

  @override
  RequestMethod method() {
    return RequestMethod.get;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}

class HistoryServletApi extends BaseApi {
  @override
  String path() {
    return "/SolarWeb/HistoryServlet";
  }

  @override
  RequestMethod method() {
    return RequestMethod.get;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}