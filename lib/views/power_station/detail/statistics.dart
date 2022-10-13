import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/home.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/utils/date.dart';
import 'package:flutter_optical_storage/widgets/common/date_picker/horizontal_month_picker.dart';
import 'package:flutter_optical_storage/widgets/home/energy/grid.dart';
import 'package:flutter_optical_storage/widgets/home/energy/overview.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// 数据统计
class PowerStatisticsPage extends StatefulWidget {
  final int id;
  const PowerStatisticsPage(this.id, {Key? key}) : super(key: key);

  @override
  State<PowerStatisticsPage> createState() => _PowerStatisticsPageState();
}

class _PowerStatisticsPageState extends State<PowerStatisticsPage> {

  List<ChartModel> chartData = [];
  late Future<HomeEnergyModel> energyData;
  @override
  void initState() {
    setState(() {
      energyData = HomeApi.fetchEnergyApi({'pid': widget.id});
    });
    getData(DateTime.now());
    super.initState();
  }
  getData(DateTime date) async {
    List<Map<String, Object>> reaData = await PowerStationApi.fetchPowerStationChartDataApi({
      'id': widget.id,
      'type': 1, // 1 日; 2 月; 3 年;
      'sdate': DataUtils.getStartMoth(date),
      'edate': DataUtils.getEndMoth(date)
    });
    List<ChartModel> listData = [];
    for (var e in reaData) {
      listData.add(ChartModel(
        e['key'] as String,
        num.parse(e['charged'] as String),
        num.parse(e['discharged'] as String)
      ));
    }
    setState(() {
      chartData = listData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeEnergyModel>(
        future: energyData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LoadingWidget();
          HomeEnergyModel data = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                HomeOverviewWidget(data),
                HomeGridWidget(data, 'detail'),
                HorizontalMonthPicker(
                  onChange: (DateTime date) {
                    getData(date);
                  },
                ),
                Stack(
                  children: [
                    const IgnorePointer(//为了防止TestWidget有点击事件
                      child: Opacity(opacity: 0.0, child: SizedBox(
                        height: 300,
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
                            width: 36.0 * chartData.length,
                            child: SfCartesianChart(
                              title: ChartTitle(text: '月充放电量统计'),
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
                                  color: Colors.green,
                                  dataSource: chartData,
                                  xValueMapper: (ChartModel data, _) => data.key,
                                  yValueMapper: (ChartModel data, _) => data.charged,
                                  //显示数据标签
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible: false,
                                    labelAlignment: ChartDataLabelAlignment.outer,
                                    textStyle: TextStyle(fontSize: 10),
                                  ),
                                ),
                                ColumnSeries<ChartModel, String>(
                                  name: '实时功率',
                                  color: Colors.red,
                                  dataSource: chartData,
                                  xValueMapper: (ChartModel data, _) => data.key,
                                  yValueMapper: (ChartModel data, _) => data.discharged,
                                  //显示数据标签
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible: false,
                                    labelAlignment: ChartDataLabelAlignment.outer,
                                    textStyle: TextStyle(fontSize: 10),
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
                // SizedBox(
                //   width: 375,
                //   height: 280,
                //   // child: Echarts(
                //   //   option: statisticEchartsOption(chartData),
                //   // ),
                // ),
              ],
            )
          );
        }
      );
  }
}

class ChartModel {
  final String key;
  final num charged;
  final num discharged;

  ChartModel(this.key, this.charged, this.discharged); 
}