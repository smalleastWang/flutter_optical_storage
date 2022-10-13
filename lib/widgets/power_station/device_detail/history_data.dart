import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/utils/date.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryDataWidget extends StatefulWidget {
  final int id;
  final String deviceId;
  const HistoryDataWidget({Key? key, required this.id, required this.deviceId}) : super(key: key);

  @override
  State<HistoryDataWidget> createState() => _HistoryDataWidgetState();
}

class _HistoryDataWidgetState extends State<HistoryDataWidget> {
  
  // List<Map<String, Object>> data = [];
  List<ChartModel> data = [];
  @override
  void initState() {
    getData('inverterPowerDataDetail', {'sdate': formatToDayStr(), 'edate': formatToDayStr()});
    super.initState();
  }
  getData(String action, Map<String, dynamic> query) async {
    query.addAll({'pn': widget.id, 'devcode': widget.deviceId});
    List<Map<String, Object>> reaData = await PowerStationApi.fetchDeviceHistoryDataApi(action, query);
    List<ChartModel> listData = [];
    for (var e in reaData) {
      listData.add(ChartModel(e['key'] as String, num.parse(e['val'] as String)));
    }
    setState(() {
      data = listData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: SingleChildScrollView(
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
            Stack(
              children: [
                const IgnorePointer(//为了防止TestWidget有点击事件
                  child: Opacity(opacity: 0.0, child: SizedBox(
                    height: 250,
                  )),//渲染步骤：布局、绘制、合成，当opacity: 0.0时，不会走，绘制、合成。即不用担心性能问题。
                ),
                const SizedBox(
                  width: double.infinity,//并不是无限大，跟你布局的约束有关
                ),
                Positioned.fill(//占满布局（要去了解stack布局原理，当有stack中有非Positioned包裹的组件时，会用该组件的大小）
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 30.0 * data.length,
                        child: SfCartesianChart(
                          //图示
                          legend: Legend(
                            isVisible: true,
                            iconHeight: 10,
                            iconWidth: 10,
                            //切换系列显示
                            toggleSeriesVisibility: true,
                            //图示显示位置
                            position: LegendPosition.bottom,
                            overflowMode: LegendItemOverflowMode.scroll,
                            //图示左右位置
                            alignment: ChartAlignment.center
                          ),
                          primaryXAxis: CategoryAxis(),
                          // 自定义y轴数值
                          // primaryYAxis: NumericAxis(minimum: -2, maximum: 10, interval: 2),
                          series: <ChartSeries<ChartModel, String>>[
                            ColumnSeries<ChartModel, String>(
                              name: '实时功率',
                              color: Colors.blue,
                              dataSource: data,
                              xValueMapper: (ChartModel data, _) => data.key,
                              yValueMapper: (ChartModel data, _) => data.val,
                              //显示数据标签
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                                labelAlignment: ChartDataLabelAlignment.outer,
                                textStyle: TextStyle(fontSize: 12),
                              ),
                            ),
                          ]
                        ),
                      )
                    ]
                  )
                )
              ]
            ),
            Text('数据更新时间：${formatToTimeStr()}'),
          ],
        )
      ),
    );
  }
}

class ChartModel {
  final String key;
  final num val;

  ChartModel(this.key, this.val); 
}