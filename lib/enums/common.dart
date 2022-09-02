
import 'package:flutter_optical_storage/widgets/common/down_menu/index.dart';

List<DownMenuItemModel> warnTypeOptions = [
  {'_code': 0, 'name': '所有类型'},
  {'_code': 1, 'name': '提示'},
  {'_code': 2, 'name': '警告'},
  {'_code': 3, 'name': '故障'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

List<DownMenuItemModel> deviceOptions = [
  {'_code': 0, 'name': '所有设备'},
  {'_code': 1, 'name': '采集器'},
  {'_code': 2, 'name': '逆变器'},
  {'_code': 3, 'name': '气象站'},
  {'_code': 4, 'name': '清扫机'},
  {'_code': 5, 'name': '汇流箱'},
  {'_code': 6, 'name': '电表'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

List<DownMenuItemModel> statusOptions = [
  {'_code': 0, 'name': '所有状态'},
  {'_code': 1, 'name': '已结束'},
  {'_code': 2, 'name': '未结束'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

List<DownMenuItemModel> powerStationOptions = [
  {'_code': 0, 'name': 'Energy Storage Station'},
  {'_code': 1, 'name': '瑞达'},
  {'_code': 2, 'name': '广东陆河服务'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();