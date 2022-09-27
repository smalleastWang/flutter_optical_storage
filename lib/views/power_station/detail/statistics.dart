import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_optical_storage/api/home.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/utils/date.dart';
import 'package:flutter_optical_storage/widgets/common/date_picker/horizontal_month_picker.dart';
import 'package:flutter_optical_storage/widgets/home/energy/grid.dart';
import 'package:flutter_optical_storage/widgets/home/energy/overview.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

import 'data.dart';

/// 数据统计
class PowerStatisticsPage extends StatefulWidget {
  final int id;
  const PowerStatisticsPage(this.id, {Key? key}) : super(key: key);

  @override
  State<PowerStatisticsPage> createState() => _PowerStatisticsPageState();
}

class _PowerStatisticsPageState extends State<PowerStatisticsPage> {

  List<Map<String, Object>> chartData = [];
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
    setState(() {
      chartData = reaData;
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
                HomeGridWidget(data),
                HorizontalMonthPicker(
                  onChange: (DateTime date) {
                    getData(date);
                  },
                ),
                SizedBox(
                  width: 375,
                  height: 280,
                  child: Echarts(
                    option: statisticEchartsOption(chartData),
                  ),
                ),

                
              ],
            )
          );
        }
      );
  }
}