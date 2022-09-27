import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/utils/date.dart';

import 'data.dart';

class HistoryDataWidget extends StatefulWidget {
  final int id;
  final String deviceId;
  const HistoryDataWidget({Key? key, required this.id, required this.deviceId}) : super(key: key);

  @override
  State<HistoryDataWidget> createState() => _HistoryDataWidgetState();
}

class _HistoryDataWidgetState extends State<HistoryDataWidget> {
  
  List<Map<String, Object>> data = [];
  @override
  void initState() {
    getData('inverterPowerDataDetail', {'sdate': formatToDayStr(), 'edate': formatToDayStr()});
    super.initState();
  }
  getData(String action, Map<String, dynamic> query) async {
    query.addAll({'pn': widget.id, 'devcode': widget.deviceId});
    List<Map<String, Object>> reaData = await PowerStationApi.fetchDeviceHistoryDataApi(action, query);
    setState(() {
      data = reaData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    getData('inverterPowerDataDetail', {'sdate': formatToDayStr(), 'edate': formatToDayStr()});
                  },
                  child: const Text('日'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    getData('inverterEnergyDay', {'sdate': formatToDayStr(), 'edate': formatToDayStr()});
                  },
                  child: const Text('月'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    getData('inverterEnergyYear', {'year': formatToYearStr()});
                  },
                  child: const Text('年'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    getData('inverterEnergyTotal', {'year': formatToYearStr()});
                  },
                  child: const Text('总'),
                ),
              ),
            ],
          ),
          Center(
            child: Text(formatToDayStr()),
          ),
          SizedBox(
            width: 300,
            height: 150,
            child: Echarts(
              option: historyEchartsOption(data),
            ),
          ),
          Text('数据更新时间：${formatToTimeStr()}'),
        ],
      ),
    );
  }
}