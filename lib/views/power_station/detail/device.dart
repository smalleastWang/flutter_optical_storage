import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/enums/common.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_device.dart';
import 'package:flutter_optical_storage/router/application.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/drop_down_menu.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/drop_down_menu_header.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/menu_controller.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/model/down_menu_item.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/widgets/menu_list.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

const deviceIcon = {
  1: 'deviceType1_',
  2: 'deviceType2_',
  3: 'deviceType3_',
  4: 'deviceType4_',
  5: 'deviceType5_',
  6: 'deviceType6_',
  7: 'deviceType7_',
  8: 'deviceType8_',
  9: 'deviceType9_',
  10: 'deviceType10_',
  11: 'deviceType11_',
  12: 'deviceType12_',
  13: 'deviceType13_',
  14: 'deviceType14_',
  15: 'deviceType15_',
};

class PowerDevice extends StatefulWidget {
  final int id;
  const PowerDevice(this.id, {Key? key}) : super(key: key);

  @override
  State<PowerDevice> createState() => _PowerDeviceState();
}

class _PowerDeviceState extends State<PowerDevice> {
  
  final MenuController _menuController = MenuController();
  DownMenuItemModel deviceSelectItem = deviceOptions[0];

  int? deviceType;
  late Future<List<DeviceList>> deviceInfo;

  @override
  void initState() {
    deviceInfo = PowerStationApi.fetchDeviceInfoApi({'id': widget.id,});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropDownMenuHeader(
          menuController: _menuController,
          clickColor: Theme.of(context).primaryColor,
          titles: const ['设备'],
        ),
        Expanded(
          child: Stack(
            children: [
              FutureBuilder<List<DeviceList>>(
                future: deviceInfo,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const LoadingWidget();
                  List<DeviceList> deviceList = snapshot.data!;
                  // if (deviceType != null) deviceList = deviceList.where((item) => deviceType == 0 || item.deviceType == deviceType).toList();
                  return ListView.builder(
                    itemCount: deviceList.length,
                    // itemExtent: 50.0, //强制高度为50.0
                    itemBuilder: (BuildContext context, int index) {
                      return _ItemDevice(deviceList[index]);
                    }
                  );
                },
              ),
              DropDownMenu(
                height: 250,
                milliseconds: 300,
                menuController: _menuController,
                children: [
                  MenuList(
                    index: 0,
                    menuController: _menuController,
                    filterList: deviceOptions,
                    onTap: (val) {
                      setState(() {
                        deviceType = val;
                      });
                    },
                  ),
                ]
              ),
            ],
          )
        ),
      ],
    );
  }
}


class _ItemDevice extends StatelessWidget {
  final DeviceList data;
  const _ItemDevice(this.data, {Key? key}) : super(key: key);

  String _getText(DeviceList data, AppLocalizations i18ns) {
    if (data.deviceType != 1) return '${i18ns.temp3Str3} ${data.addr}';
    switch (int.parse(data.pType!)) {
      case 1: return i18ns.loggerType1;
      case 2: return i18ns.loggerType2;
      case 3: return i18ns.loggerType3;
      case 4: return i18ns.loggerType4;
      case 5: return i18ns.loggerType5;
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return InkWell(
      onTap: () {
        Application.navigateTo(
          context, Routes.powerStationDetailDeviceInfo,
          params: {'id': data.pId, 'name': data.devname, 'addr': data.addr, 'loggerNum': data.loggerNum, 'deviceId': data.deviceId, 'deviceType': data.deviceType}
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.4))),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset('assets/images/${deviceIcon[data.deviceType]}1.png'),
            ),
            Expanded(
            flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('名称：${data.devname}'),
                      Text('编号：${data.deviceId}'),
                      Text(_getText(data, i18ns))
                      // Text(data.deviceType == 1 ? '类型：${data.devname}' : '地址：${data.addr}'),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey.withOpacity(0.8))
                ],
              )
            ),
            
          ],
        ),
      ),
    );
  }
}