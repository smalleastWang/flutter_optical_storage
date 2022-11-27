
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/home.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/models/api/home/photovoltaic_model.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/widgets/home/chart.dart';
import 'package:flutter_optical_storage/widgets/home/grid.dart';
import 'package:flutter_optical_storage/widgets/home/market_map.dart';
import 'package:flutter_optical_storage/widgets/home/overview.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PowerStationModel> powerListData = [];
  Future<HomePhotovoltaicModel>? photovoltaicData;
  Future<HomeEnergyModel>? energyData;

  @override
  void initState() {
    initData();
    super.initState();
  }
  initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? rolepower = prefs.getInt('rolepower') ?? 688;
    List<PowerStationModel> powerListDataRes = await PowerStationApi.fetchListApi({});
    setState(() {
      powerListData = powerListDataRes;
      if (rolepower&(1<<9) == 0) { // 光伏
        photovoltaicData = HomeApi.fetchPhotovoltaicApi();
      } else { // 储能
        energyData = HomeApi.fetchEnergyApi({});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget widget = const SizedBox.shrink();
    if (photovoltaicData != null) { // 光伏
      widget = FutureBuilder<HomePhotovoltaicModel>(
        future: photovoltaicData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LoadingWidget();
          HomePhotovoltaicModel data = snapshot.data!;
          return Column(
            children: [
              HomeOverviewPhotovoltaicWidget(data: data, powerList: powerListData),
              HomeGridPhotovoltaicWidget(data, 'home'),
              AmapMarketWidget(powerListData)
            ],
          );
        },
      );
    } else if (energyData != null) { // 储能
      widget = FutureBuilder<HomeEnergyModel>(
        future: energyData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LoadingWidget();
          HomeEnergyModel data = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                HomeOverviewWidget(data),
                HomeGridWidget(data, 'home'),
                HomeChartWidget(data),
              ],
            )
          );
        }
      );
    }
    return widget;
  }
}
