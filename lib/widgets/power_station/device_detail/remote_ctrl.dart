

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/power_station/device_remote_ctrl.dart';
import 'package:flutter_optical_storage/models/common/option_model.dart';
import 'package:flutter_optical_storage/store/root.dart';
import 'package:flutter_optical_storage/utils/date.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focus_widget/focus_widget.dart';
import 'package:provider/provider.dart';

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
  void dispose() {
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return FutureBuilder<List<PowerDeviceRemoteCtrlModel>>(
      future: remoteCtrlData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LoadingWidget();
        List<PowerDeviceRemoteCtrlModel> data = snapshot.data ?? [];
        return DataTable2(
          bottomMargin: 20,
          border: TableBorder.all(color: Colors.grey.withOpacity(.2)),
          columnSpacing: 4,
          horizontalMargin: 4,
          minWidth: 560,
          headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            return Colors.green.withOpacity(.15);
          }),
          columns: [
            DataColumn2(label: Center(child: Text(i18ns.fieldName)), fixedWidth: 140),
            DataColumn2(label: Center(child: Text(i18ns.operation)), fixedWidth: 175),
            DataColumn2(label: Center(child: Text(i18ns.desc)), fixedWidth: 150),
            DataColumn2(label: Center(child: Text(i18ns.command)), size: ColumnSize.S),
          ],
          rows: List<DataRow>.generate(data.length, (index) {
            PowerDeviceRemoteCtrlModel currData = data[index];
            TextEditingController valController = TextEditingController();
            valController.text = currData.defValue ?? '';
            String desc = '-';

            Widget actWidget = const SizedBox.shrink();
            // 1：设置参数命令 2：控制命令  3：设置指定参数命令 4:设置时间，时间格式：时，分，秒，年，月，日
            switch (currData.cmdType) {
              case 1:
              case 2:
                if (currData.cmdType == 1) {
                  String minVal = currData.minValue!.split("#")[0];
                  String unit = '';
                  num.parse(minVal) is int ? unit += i18ns.integer : unit += i18ns.integerordecimal;
                  desc = '$minVal~${currData.maxValue},$unit';
                }
                actWidget = FocusWidget.builder(
                  context,
                  builder: (ctx, focusNode) => TextField(
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    controller: valController,
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: '输入值',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
                break;
              case 3:
                List<String> dataArr =  currData.maxValue!.substring(0, currData.maxValue!.length - 1).split('],');
                List<OptionModel> options = dataArr.map((i) {
                  List<String> item = i.substring(1).split(',');
                  return OptionModel(value: int.parse(item[0]), label: item[1]);
                }).toList();
                actWidget = InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Picker(
                      height: 200,
                      confirmText: i18ns.ok,
                      cancelText: i18ns.cancel,
                      adapter: PickerDataAdapter<int>(data: options.map((e) => PickerItem(value: e.value, text: Text(e.label))).toList()),
                      textStyle: const TextStyle(color: Colors.black54),
                      columnPadding: const EdgeInsets.all(8.0),
                      onConfirm: (Picker picker, List<int> value) {
                        setState(() {
                          data[index].defValue = value[0].toString();
                        });
                      }
                    ).showModal(context);
                  },
                  child: Text(options.firstWhere((i) => i.value == num.parse(currData.defValue!).toInt(), orElse: () => options[0]).label));
                break;
              case 4: actWidget = InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Picker(
                    confirmText: i18ns.ok,
                    cancelText: i18ns.cancel,
                    height: 200,
                    adapter: DateTimePickerAdapter(
                      isNumberMonth: true,
                      value: currData.defValue == null || currData.defValue == '0' ? DateTime.now() : DateTime.parse(currData.defValue!),
                      customColumnType: [0, 1, 2, 3, 4],
                    ),
                    title: Text(i18ns.pickTime),
                    onConfirm: (Picker picker, List value) {
                      setState(() {
                        data[index].defValue = formatToTimeStr((picker.adapter as DateTimePickerAdapter).value!);
                      });
                    }
                  ).showModal(context);
                },
                child: Text(currData.defValue == null || currData.defValue == '0' ? formatToTimeStr(DateTime.now()) : currData.defValue!),
              );
                break;
              default:
            }
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (index.isOdd) return Colors.grey.withOpacity(.01);
                return Colors.white;
              }),
              cells: [
                DataCell(Center(child: Text('${currData.cmdName}'))),
                DataCell(Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: actWidget
                )),
                DataCell(Center(
                  child: Text(desc))
                ),
                DataCell(
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () async {
                        Map<String, dynamic> query = {};
                        query['cmdType'] = currData.cmdType;
                        query['cmdToken'] = currData.cmdToken;
                        query['cmdName'] = currData.cmdName;
                        query['devcode'] = currData.deviceId;
                        query['gateid'] = currData.gateId;
                        switch (currData.cmdType) {
                          case 1:
                          case 2: query['val'] = valController.text; break;
                          case 3:
                          case 4: query['val'] = currData.defValue; break;
                          default:
                        }
                        query['val'] = valController.text;
                        EasyLoading.show();
                        Map<String, dynamic> res = await PowerStationApi.fetchDeviceRemoteCtrlHandleApi(query);
                        EasyLoading.dismiss();
                        if (res['err'] == 0) {
                          Fluttertoast.showToast(msg: i18ns.ctrlNote5);
                        } else {
                          Fluttertoast.showToast(msg: i18ns.error2);
                        }
                        // print(values[index]);
                       },
                      child: Text(i18ns.excute),
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