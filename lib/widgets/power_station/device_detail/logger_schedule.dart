import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_logger_schedule.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

Map<int, String> actTypeEnum = {
  1: '单次执行',
  2: '周期执行'
};
Map<int, String>  actionEnum = {
  1: '充电',
  2: '休息',
  3: '储能系统提供',
  4: '太阳能与市电充电',
  5: '太阳能充电',
  6: '光伏发电'
};

class DeviceLoggerScheduleWidget extends StatefulWidget {
  final String loggerNum;
  const DeviceLoggerScheduleWidget({Key? key, required this.loggerNum}) : super(key: key);

  @override
  State<DeviceLoggerScheduleWidget> createState() => _DeviceLoggerScheduleWidgetState();
}

class _DeviceLoggerScheduleWidgetState extends State<DeviceLoggerScheduleWidget> {
 late Future<List<PowerDeviceLoggerScheduleModel>> remoteCtrlData;

  @override
  void initState() {
    remoteCtrlData = PowerStationApi.fetchDeviceLoggerScheduleApi({'sn': widget.loggerNum});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return FutureBuilder<List<PowerDeviceLoggerScheduleModel>>(
      future: remoteCtrlData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LoadingWidget();
        List<PowerDeviceLoggerScheduleModel> data = snapshot.data ?? [];
        return DataTable2(
          bottomMargin: 20,
          border: TableBorder.all(color: Colors.grey.withOpacity(.2)),
          columnSpacing: 4,
          horizontalMargin: 4,
          minWidth: 750,
          headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            return Colors.green.withOpacity(.15);
          }),
          columns: [
            DataColumn2(label: Center(child: Text(i18ns.number)), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text(i18ns.name)), fixedWidth: 150),
            DataColumn2(label: Center(child: Text(i18ns.timeInterval)), fixedWidth: 150),
            DataColumn2(label: Center(child: Text(i18ns.action)), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text(i18ns.powerSche))),
            DataColumn2(label: Center(child: Text(i18ns.actionType)), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text(i18ns.period)), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text(i18ns.energyPrice)), size: ColumnSize.S),
          ],
          rows: List<DataRow>.generate(data.length, (index) {
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (index.isOdd) return Colors.grey.withOpacity(.01);
                return Colors.white;
              }),
              cells: [
                DataCell(Center(child: Text('${data[index].id}'))),
                DataCell(Center(child: Text('${data[index].name}'))),
                DataCell(Center(child: Text('${data[index].startTime}-${data[index].endTime}'))),
                DataCell(Center(child: Text('${actionEnum[data[index].cmdNo]}'))),
                DataCell(Center(child: Text('${data[index].schePower}'))),
                DataCell(Center(child: Text('${actTypeEnum[data[index].actType]}'))),
                DataCell(Center(child: Text('${data[index].period}'))),
                DataCell(Center(child: Text('${data[index].price}'))),
              ]
            );
          })
        );
      },
    );
  }
}