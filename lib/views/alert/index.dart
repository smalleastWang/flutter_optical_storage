import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/alert.dart';
import 'package:flutter_optical_storage/enums/common.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/alert/alert_item.dart';
import 'package:flutter_optical_storage/utils/date.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/index.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

  final MenuController _menuController = MenuController();
  DownMenuItemModel warnTypeSelectItem = warnTypeOptions[0];
  DownMenuItemModel deviceSelectItem = deviceOptions[0];
  DownMenuItemModel statusSelectItem = statusOptions[0];
  DownMenuItemModel powerStationSelectItem = powerStationOptions[0];

  late Future<List<AlertItemModel>> alertList;
  String sdate = formatToDayStr();
  String edate = formatToDayStr();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    String languageCode = AppLocalizations.of(context).languageCode;
    alertList = AlertApi.fetchListApi({
      "lang": languageCode ?? 'zh_CN',
      "sdate": sdate,
      "edate": edate,
      "level": "all",
      "devtype": "all",
      "handle": "all",
      "pid": "314",
      "page": "0",
      "pagesize": "10"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () async {
              DateTimeRange? rangeTime = await showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030));
              if (rangeTime != null) {
                setState(() {
                  sdate = formatToDayStr(rangeTime.start);
                  edate = formatToDayStr(rangeTime.end);
                });
                getData();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text('$sdate/$edate'),
            ),
          ),
        ),
        DropDownMenuHeader(
          headHeight: 30,
          menuController: _menuController,
          clickColor: Theme.of(context).primaryColor,
          titles: const ['警告类型', '设备', '状态', '电站'],
        ),
        Expanded(
          child: Stack(
            children: [
              // InkWell(
              //   child: Center(
              //     child: Text(
              //         '选择：item${_menuController.index}-- ${_menuController.title}'),
              //   ),
              //   onTap: () {
              //     print('123123');
              //   },
              // ),
              
              FutureBuilder<List<AlertItemModel>>(
                future: alertList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const LoadingWidget();
                  List<AlertItemModel> data = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: data.length,
                    // itemExtent: 50.0, //强制高度为50.0
                    itemBuilder: (BuildContext context, int index) {
                      return _ItemAlert(data[index]);
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
                    // choose: Choose.multi,
                    menuController: _menuController,
                    filterList: warnTypeOptions,
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                  MenuList(
                    index: 1,
                    menuController: _menuController,
                    filterList: deviceOptions,
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                  MenuList(
                    index: 2,
                    menuController: _menuController,
                    filterList: statusOptions,
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                  MenuList(
                    index: 3,
                    menuController: _menuController,
                    filterList: powerStationOptions,
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                ]
              ),
            ],
          )
        ),
        
      ]
    );
  }
}

class _ItemAlert extends StatelessWidget {
  final AlertItemModel data;
  const _ItemAlert(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, // 底色
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)],
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('发生时间: ${data.startTime!}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('设备名称: ${data.devname}'),
                Text('警告类型: ${data.eventLevel}')
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('告警描述: ${data.message}')
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('消失时间: ${data.disappearTime}'),
            ],
          )
        ],
      ),
    );
  }
}