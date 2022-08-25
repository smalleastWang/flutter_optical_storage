import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/models/api/power_station.dart';

class PowerStationItemWidget extends StatelessWidget {
  final PowerStation data;
  const PowerStationItemWidget({Key? key, required this.data}) : super(key: key);

  Widget rowItem (String label, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: const EdgeInsets.only(right: 10), child: Text(label)),
        Expanded(child: Text(value ?? '', overflow: TextOverflow.ellipsis, textAlign: TextAlign.right))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image(
              width: 100,
              image: AssetImage("assets/images/${data.status == 0 ?'batteryP' : 'pvbattery'}.jpg")
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                rowItem('电站名称', data.name),
                rowItem('电站状态', data.status.toString()),
                rowItem('光伏日发电量', data.name),
                rowItem('今日充电量', data.name),
                rowItem('今日放电量', data.name),
              ],
            ),
          )
          
        ]
      ),
    );
  }
}
