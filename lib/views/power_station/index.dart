import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:flutter_optical_storage/widgets/power_station/list_item.dart';

class PowerStationPage extends StatefulWidget {
  const PowerStationPage({Key? key}) : super(key: key);

  @override
  State<PowerStationPage> createState() => _PowerStationPageState();
}

class _PowerStationPageState extends State<PowerStationPage> {


  List<PowerStationModel> powerStationListSource = [];
  List<PowerStationModel> powerStationList = [];
  bool isloading = true;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    List<PowerStationModel> data = await PowerStationApi.fetchListApi({});
    setState(() {
      powerStationListSource = data;
      powerStationList = data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Container(
      color: Colors.grey.withOpacity(.1),
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TextField(
              // autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                hintText: i18ns.plants1,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.withOpacity(0.15)
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                setState(() {
                  powerStationList = powerStationListSource.where((item) => item.name!.contains(value)).toList();
                });
              }
            )
          ),
          Expanded(
            flex: 1,
            child: isloading ? const LoadingWidget() : ListView.builder(
              itemCount: powerStationList.length,
              itemBuilder: (BuildContext context, int index) {
                return PowerStationItemWidget(data: powerStationList[index]);
              }
            ),
          )
          
        ],
      ),
    );
  }
}