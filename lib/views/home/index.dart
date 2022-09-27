
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/home.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/models/api/home/photovoltaic_model.dart';
import 'package:flutter_optical_storage/widgets/home/energy/chart.dart';
import 'package:flutter_optical_storage/widgets/home/energy/grid.dart';
import 'package:flutter_optical_storage/widgets/home/energy/overview.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<HomePhotovoltaicModel> photovoltaicData;
  late Future<HomeEnergyModel> energyData;
  int role = 2; // 光伏

  @override
  void initState() {
    initData();
    super.initState();
  }
  initData() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // int? rolepower = prefs.getInt('rolepower') ?? 688;
      photovoltaicData = HomeApi.fetchPhotovoltaicApi();
      energyData = HomeApi.fetchEnergyApi({});
      // if (rolepower&(1<<9) == 0) { // 光伏
      //   photovoltaicData = HomeApi.fetchPhotovoltaicApi();
      // } else { // 储能
      //   energyData = HomeApi.fetchEnergyApi();
      // }
    });
  }
  @override
  Widget build(BuildContext context) {
    if (role == 1) { // 光伏
      return SingleChildScrollView(
        child: FutureBuilder<HomePhotovoltaicModel>(
          future: photovoltaicData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            // HomePhotovoltaicModel? data = snapshot.data;
            return Column(
              children: const [
                // HomeOverviewWidget(photovoltaicData: data),
                // HomeGridWidget(photovoltaicData: data),
                // HomeChartWidget(photovoltaicData: data),
              ],
            );
          },
        ),
      );
    } else { // 储能
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
                HomeChartWidget(data),
              ],
            )
          );
        }
      );
    }
  }
}
