import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_realtime.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

class DeviceRealtimeWidget extends StatefulWidget {
  final String deviceId;
  const DeviceRealtimeWidget({Key? key, required this.deviceId}) : super(key: key);

  @override
  State<DeviceRealtimeWidget> createState() => _DeviceRealtimeWidgetState();
}

class _DeviceRealtimeWidgetState extends State<DeviceRealtimeWidget> {

  late Future<List<PowerDeviceRealtimeDataModel>> realtimeData;

  @override
  void initState() {
    realtimeData = PowerStationApi.fetchDeviceRealtimeDataApi({"deviceID": widget.deviceId});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PowerDeviceRealtimeDataModel>>(
      future: realtimeData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LoadingWidget();
        List<PowerDeviceRealtimeDataModel> data = snapshot.data ?? [];
        return DataTable2(
          bottomMargin: 20,
          border: TableBorder.all(color: Colors.grey.withOpacity(.2)),
          columnSpacing: 4,
          horizontalMargin: 4,
          minWidth: 550,
          headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            return Colors.green.withOpacity(.15);
          }),
          columns: const [
            DataColumn2(label: Center(child: Text('信号通道')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('信号名称')), fixedWidth: 140),
            DataColumn2(label: Center(child: Text('实时值'))),
            DataColumn2(label: Center(child: Text('单位')), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('数据更新时间')), fixedWidth: 150),
          ],
          rows: List<DataRow>.generate(data.length, (index) {
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (index.isOdd) return Colors.grey.withOpacity(.01);
                return Colors.white;
              }),
              cells: [
                DataCell(Center(child: Text('${data[index].signalId}'))),
                DataCell(Center(child: Text('${data[index].signalName}'))),
                DataCell(Center(child: Text('${data[index].signalValue}'))),
                DataCell(Center(child: Text('${data[index].signalUnit}'))),
                DataCell(Center(child: Text('${data[index].currentTime}'))),
              ]
            );
          })
        );
      },
    );
  }
}