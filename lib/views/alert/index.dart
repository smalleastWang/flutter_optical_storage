import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/alert.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/enums/common.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/alert/alert_item.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/utils/const.dart';
import 'package:flutter_optical_storage/utils/date.dart';
import 'package:flutter_optical_storage/utils/tool.dart';
import 'package:flutter_optical_storage/widgets/common/down_menu/index.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';


class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

  final MenuController _menuController = MenuController();
  // final ScrollController _scrollController = ScrollController();
  List<DownMenuItemModel> powerStationOptions = [];
  List<AlertItemModel> alertList = [];
  String sdate = formatToDayStr();
  String edate = formatToDayStr();
  String level = 'all';
  String devtype = 'all';
  String handle = 'all';
  String pid = '';
  bool isloading = true;
  // int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    await getPowerStation();
    getData();
  }
  getPowerStation() async {
    List<PowerStationModel> data = await PowerStationApi.fetchListApi({});
    List<DownMenuItemModel> powerStationList = [];
    for (var item in data) {
      powerStationList.add(DownMenuItemModel(code: item.id, name: item.name));
    }
    if (powerStationList.isNotEmpty) {
      setState(() {
        powerStationOptions = powerStationList;
        pid = data[0].id.toString();
      });
    }
  }
  getData() async {
    setState(() {
      isloading = true;
    });
    List<AlertItemModel> resData = await AlertApi.fetchListApi({
      "lang": languageMap[Const.lang] ?? 'zh_CN',
      "sdate": sdate,
      "edate": edate,
      "level": level,
      "devtype": devtype,
      "handle": handle,
      "pid": pid,
      "page": 0,
      "pagesize": 100
    });
    setState(() {
      alertList = resData;
      isloading = false;
    });
  }

  List<DataColumn2> get _columns {
    return const [
      DataColumn2(
        label: Center(child: Text('设备名称')),
      ),
      DataColumn2(
        label: Center(child: Text('告警描述')),
      ),
      DataColumn2(
        label: Center(child: Text('告警类型')),
      ),
      DataColumn2(
        label: Center(child: Text('发生时间')),
        fixedWidth: 136
      ),
      DataColumn2(
        label: Center(child: Text('消失时间')),
        fixedWidth: 136
      ),
    ];
  }

   String getWarnTypeName(type) {
    DownMenuItemModel? typeOption = warnTypeOptions.firstWhere((v) {
      return v.code == type;
    }, orElse: () {
      return DownMenuItemModel();
    });
    return typeOption.name ?? '';
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
              isloading ? const LoadingWidget() : DataTable2(
                // bottomMargin: 20,
                border: TableBorder.all(color: Colors.grey.withOpacity(.2)),
                columnSpacing: 4,
                horizontalMargin: 4,
                minWidth: 560,
                dataTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  return Colors.green.withOpacity(.15);
                }),
                columns: _columns,
                rows: List<DataRow>.generate(alertList.length, (index) {
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                      if (index.isOdd) return Colors.grey.withOpacity(.01);
                      return Colors.white;
                    }),
                    cells: [
                      DataCell(Center(child: Text('${alertList[index].devname}'))),
                      DataCell(Center(child: Text('${alertList[index].message}'))),
                      DataCell(Center(child: Text(getWarnTypeName(alertList[index].eventLevel)))),
                      DataCell(Center(child: Text('${alertList[index].startTime}'))),
                      DataCell(Center(child: Text('${alertList[index].disappearTime}'))),
                    ]
                  );
                })
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
                    onTap: (value) {
                      setState(() {
                        level = value == 0 ? 'all' : value.toString();
                      });
                      getData();
                    },
                  ),
                  MenuList(
                    index: 1,
                    menuController: _menuController,
                    filterList: deviceOptions,
                    onTap: (value) {
                      setState(() {
                        devtype = value == 0 ? 'all' : value.toString();
                      });
                      getData();
                    },
                  ),
                  MenuList(
                    index: 2,
                    menuController: _menuController,
                    filterList: statusOptions,
                    onTap: (value) {
                      setState(() {
                        handle = value == 0 ? 'all' : value.toString();
                      });
                      getData();
                    },
                  ),
                  MenuList(
                    index: 3,
                    menuController: _menuController,
                    filterList: powerStationOptions,
                    onTap: (index) {
                      setState(() {
                        pid = powerStationOptions[index].code.toString();
                      });
                      getData();
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