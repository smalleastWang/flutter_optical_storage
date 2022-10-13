
import 'package:flutter_optical_storage/widgets/common/down_menu/index.dart';

List<DownMenuItemModel> warnTypeOptions = [
  {'code': 0, 'name': '所有类型'},
  {'code': 1, 'name': '提示'},
  {'code': 2, 'name': '警告'},
  {'code': 3, 'name': '故障'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

List<DownMenuItemModel> deviceOptions = [
  {'code': 0, 'name': '所有设备'},
  {'code': 1, 'name': '采集器'},
  {'code': 2, 'name': '逆变器'},
  {'code': 3, 'name': '气象站'},
  {'code': 4, 'name': '清扫机'},
  {'code': 5, 'name': '汇流箱'},
  {'code': 6, 'name': '电表'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

List<DownMenuItemModel> statusOptions = [
  {'code': 0, 'name': '所有状态'},
  {'code': 1, 'name': '已结束'},
  {'code': 2, 'name': '未结束'},
].map((e) => DownMenuItemModel.fromJson(e)).toList();

// List<DownMenuItemModel> powerStationOptions = [
//   {'code': 0, 'name': 'Energy Storage Station'},
//   {'code': 1, 'name': '瑞达'},
//   {'code': 2, 'name': '广东陆河服务'},
// ].map((e) => DownMenuItemModel.fromJson(e)).toList();