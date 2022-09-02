import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/power_station.dart';

class PowerStationApi {
  // 电站列表接口
  static Future<List<PowerStationModel>> fetchListApi(String action) async {
    //验证通过提交数据
    Map<String, dynamic> query = { "action": action };
    List<dynamic> data = await CommonApi().request(query: query);
    List<PowerStationModel> list = [];
    for (var item in data) {
      list.add(PowerStationModel.fromJson(item));
    }
    return list;
  }
}