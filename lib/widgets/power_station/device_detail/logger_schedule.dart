import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_logger_schedule.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

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
          columns: const [
            DataColumn2(label: Center(child: Text('序号')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('名称')), fixedWidth: 150),
            DataColumn2(label: Center(child: Text('时间段')), fixedWidth: 150),
            DataColumn2(label: Center(child: Text('动作')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('调度功率(kW)'))),
            DataColumn2(label: Center(child: Text('动作类型')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('周期(秒)')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('电价')), size: ColumnSize.S),
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
                DataCell(Center(child: Text('${data[index].cmdNo}'))),
                DataCell(Center(child: Text('${data[index].schePower}'))),
                DataCell(Center(child: Text('${data[index].actType}'))),
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