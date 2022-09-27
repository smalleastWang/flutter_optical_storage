import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/widgets/power_station/list_item.dart';

class PowerStationPage extends StatefulWidget {
  const PowerStationPage({Key? key}) : super(key: key);

  @override
  State<PowerStationPage> createState() => _PowerStationPageState();
}

class _PowerStationPageState extends State<PowerStationPage> {


  List<PowerStationModel> powerStationList = [];

  @override
  void initState() {
    initList();
    super.initState();
  }

  initList() async {
    List<PowerStationModel> data = await PowerStationApi.fetchListApi({});
    setState(() {
      powerStationList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                hintText: "搜索电站",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.withOpacity(0.15)
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
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