import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/alert/alert_item.dart';

class AlertApi {
  // 告警列表
  static Future<List<AlertItemModel>> fetchListApi(Map<String, dynamic> params) async {
    Map<String, dynamic> query = {'action': 'queryWarnPlants'};
    query.addAll(params);
    List<dynamic> data = await CommonApi().request(query: query);
    List<AlertItemModel> list = [];
    for (var item in data) {
      list.add(AlertItemModel.fromJson(item));
    }
    return list;
  }

}