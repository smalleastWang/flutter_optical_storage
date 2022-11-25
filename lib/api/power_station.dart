import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_logger_schedule.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_realtime.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_remote_ctrl.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_device.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/weather_model.dart';
import 'package:flutter_optical_storage/models/common/echart.dart';

class PowerStationApi {
  /// 
  /// 电站列表接口
  static Future<List<PowerStationModel>> fetchListApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'plants'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request<List<dynamic>>(query: query);
    List<PowerStationModel> list = [];
    for (var item in data) {
      list.add(PowerStationModel.fromJson(item));
    }
    return list;
  }
  /// 
  /// 电站列表每项数据
  static Future<List<KeyValModal>> fetchListItemDataApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'getCurrentData'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    List<KeyValModal> list = [];
    for (var item in data) {
      list.add(KeyValModal.fromJson(item));
    }
    return list;
  }
  /// 
  /// 天气信息
  static Future<WeatherModel> fetchWeatherApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'queryWeather'};
    query.addAll(params);
    Map<String, dynamic> data = await CommonApi().request(query: query);
    return WeatherModel.fromJson(data);
  }
  ///
  /// 设备信息
  static Future<PowerDeviceModel> fetchDeviceInfoApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'getDeviceData'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    return PowerDeviceModel.fromJson(data.first);
  }
  /// 
  /// 设备实时数据
  static Future<List<PowerDeviceRealtimeDataModel>> fetchDeviceRealtimeDataApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'getDeviceRealtimeData'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    List<PowerDeviceRealtimeDataModel> list = [];
    for (var item in data) {
      list.add(PowerDeviceRealtimeDataModel.fromJson(item));
    }
    return list;
  }
  /// 
  /// 设备远程控制列表
  static Future<List<PowerDeviceRemoteCtrlModel>> fetchDeviceRemoteCtrlApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'querydeviceCtrlView'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    List<PowerDeviceRemoteCtrlModel> list = [];
    for (var item in data) {
      list.add(PowerDeviceRemoteCtrlModel.fromJson(item));
    }
    return list;
  }
  /// 
  /// 执行远程控制
  static Future<Map<String, dynamic>> fetchDeviceRemoteCtrlHandleApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'deviceControl'};
    query.addAll(params);
    Map<String, dynamic> data = await CommonApi().request(query: query);
    return data;
    
  }
  /// 
  /// 调度时刻表
  static Future<List<PowerDeviceLoggerScheduleModel>> fetchDeviceLoggerScheduleApi(Map<String, dynamic> params) async {
    //验证通过提交数据
    Map<String, dynamic> query = {'action': 'queryDataloggerSchedule'};
    query.addAll(params);
    List<dynamic> data = await ConfigApi().request(query: query);
    List<PowerDeviceLoggerScheduleModel> list = [];
    for (var item in data) {
      list.add(PowerDeviceLoggerScheduleModel.fromJson(item));
    }
    return list;
  }
  /// 
  /// 历史数据
  static Future<List<Map<String, Object>>> fetchDeviceHistoryDataApi(String action, Map<String, dynamic> params) async {
    Map<String, dynamic> query = {'action': action};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    List<Map<String, Object>> list = [];
    for (var item in data) {
      list.add({'key': item['key'].split(' ').last, 'val': item['val']});
    }
    return list;
  }

  /// 
  /// 历史数据
  static Future<List<Map<String, Object>>> fetchPowerStationChartDataApi(Map<String, dynamic> params) async {
    Map<String, dynamic> query = {'action': 'getPlantStorageStatistic'};
    query.addAll(params);
    List<dynamic> data = await HistoryServletApi().request(query: query);
    List<Map<String, Object>> list = [];
    for (var item in data) {
      list.add({'key': item['key'], 'charged': item['charged'], 'discharged': item['discharged']});
    }
    return list;
  }
  /// 
  /// 刷新设备实时数据
  static Future<Map<String, dynamic>> fetchRefreshDeviceDataApi(Map<String, dynamic> params) async {
    Map<String, dynamic> query = {'action': 'refreshDeviceRealtimeData'};
    query.addAll(params);
    Map<String, dynamic> data = await ConfigApi().request(query: query);
    return data;
  }
}