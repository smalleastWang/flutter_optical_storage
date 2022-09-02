
import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/models/api/home/photovoltaic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApi {
  // 光伏
  static Future<HomePhotovoltaicModel> fetchPhotovoltaicApi() async {
    Map<String, dynamic> query = { "action": 'plantStatistic' };
    Map<String, dynamic> data = await CommonApi().request(query: query);
    return HomePhotovoltaicModel.fromJson(data);
  }

  // 储能
  static Future<HomeEnergyModel> fetchEnergyApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? officeIDs = prefs.getString('officeIDs') ?? '296,314,315';
    Map<String, dynamic> query = { "action": 'plantStorageStatistic' };
    query['pid'] = officeIDs;
    Map<String, dynamic> data = await EnergyApi().request(query: query);
    return HomeEnergyModel.fromJson(data);
  }
}