import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_remote_ctrl.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

class DeviceRemoteCtrlWidget extends StatefulWidget {
  final int id;
  final String deviceId;
  const DeviceRemoteCtrlWidget({Key? key, required this.deviceId, required this.id}) : super(key: key);

  @override
  State<DeviceRemoteCtrlWidget> createState() => _DeviceRemoteCtrlWidgetState();
}

class _DeviceRemoteCtrlWidgetState extends State<DeviceRemoteCtrlWidget> {
  late Future<List<PowerDeviceRemoteCtrlModel>> remoteCtrlData;

  @override
  void initState() {
    remoteCtrlData = PowerStationApi.fetchDeviceRemoteCtrlApi({'devcode': widget.deviceId, 'pn': widget.id});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PowerDeviceRemoteCtrlModel>>(
      future: remoteCtrlData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LoadingWidget();
        List<PowerDeviceRemoteCtrlModel> data = snapshot.data ?? [];
        List<String?> values = []..length = data.length;
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
            DataColumn2(label: Center(child: Text('字段名')), fixedWidth: 150),
            DataColumn2(label: Center(child: Text('操作')), fixedWidth: 140),
            DataColumn2(label: Center(child: Text('描述')), fixedWidth: 150),
            DataColumn2(label: Center(child: Text('指令下发')), size: ColumnSize.S),
          ],
          rows: List<DataRow>.generate(data.length, (index) {
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (index.isOdd) return Colors.grey.withOpacity(.01);
                return Colors.white;
              }),
              cells: [
                DataCell(Center(child: Text('${data[index].cmdName}'))),
                DataCell(Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    // keyboardType: TextInputType.multiline,
                    // maxLines: null,
                    // cursorHeight: 30,
                    autofocus: true,
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: '输入值',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      values.setAll(index, [value]);
                    },
                  )
                )),
                DataCell(Center(
                  child: Text('${data[index].minValue}-${data[index].maxValue}'))
                ),
                DataCell(
                  Center(
                    child: ElevatedButton(
                      onPressed: () { 
                        print(values[index]);
                       },
                      child: const Text('执行'),
                    )
                  )
                ),
              ]
            );
          })
        );
      },
    );
  }
}

class _CardWidget extends StatelessWidget {
  final PowerDeviceRemoteCtrlModel rowData;
  const _CardWidget(this.rowData, {Key? key}) : super(key: key);

  _showInputDialog(BuildContext _context) {
    String _name = "";
    showDialog<String>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext __context) {
        return AlertDialog(
          title: const Text('输入姓名'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(hintText: '输入值'),
                  onChanged: (value) {
                    _name = value;
                  },
                )
              )
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(__context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('执行'),
              onPressed: () {
                if (_name == "") {
                  
                } else {
                  Navigator.of(__context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white, // 底色
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${rowData.cmdName}', style: const TextStyle(fontSize: 16)),
            ElevatedButton(
              child: const Text('操作'),
              onPressed: () => _showInputDialog(context)
              ,
            ),
          ],
        )
    );
  }
}