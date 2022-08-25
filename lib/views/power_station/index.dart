import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/models/api/power_station.dart';
import 'package:flutter_optical_storage/widgets/power_station/list_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PowerStationPage extends StatefulWidget {
  const PowerStationPage({Key? key}) : super(key: key);

  @override
  State<PowerStationPage> createState() => _PowerStationPageState();
}

class _PowerStationPageState extends State<PowerStationPage> {

  List<PowerStation> powerStationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
    
  }

  getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      Fluttertoast.showToast(msg: 'userId为空');
      return;
    }
    Map<String, dynamic> query = {
      "action": "plants",
      "userid": "82",
    };
    CommonApi().request(
      query: query,
      successCallBack: (res) {
        var data = res['dat'];
        List<PowerStation> list = [];
        data.forEach((item) => list.add(PowerStation.fromJson(item)));
        setState(() {
          powerStationList = list;
        });
      },
      errorCallBack: (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              // PowerStationItemWidget
            }
          ),
        )
        
      ],
    );
  }
}