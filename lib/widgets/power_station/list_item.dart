import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/models/common/echart.dart';
import 'package:flutter_optical_storage/router/application.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:flutter_optical_storage/widgets/power_station/status.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Map<int, dynamic> typeParam = {
  1: 'ENERGY_TODAY,CURRENT_POWER',
  2: 'BATTERY_STATUS,CHARGED_TODAY,DISCHARGED_TODAY',
  3: 'ENERGY_TODAY,CHARGED_TODAY,DISCHARGED_TODAY'
};
class PowerStationItemWidget extends StatefulWidget {
  final PowerStationModel data;
  const PowerStationItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<PowerStationItemWidget> createState() => _PowerStationItemWidgetState();
}

class _PowerStationItemWidgetState extends State<PowerStationItemWidget> {

  List<KeyValModal> itemData = [];

  @override
  void initState() {
    super.initState();
    getKeyValData();
  }

  getKeyValData() async {
    List<KeyValModal> keyValData = await PowerStationApi.fetchListItemDataApi({
      'id': widget.data.id,
      'param': typeParam[widget.data.type] ?? typeParam[1]
    });
    setState(() {
      List<KeyValModal> sourceData = [];
      AppLocalizations i18ns = AppLocalizations.of(context);
      sourceData.add(KeyValModal(key: i18ns.plants3, val: widget.data.name!));
      sourceData.add(KeyValModal(key: i18ns.plants4, widgetVal: PowerStationStatusWidget(status: widget.data.status!)));
      for (var item in keyValData) {
        switch (item.key) {
          case 'ENERGY_TODAY':
            item.key = i18ns.pvyeildToday; 
            item.val = '${item.val}kWh'; 
            break;
          case 'CURRENT_POWER':
            item.key = i18ns.plants6;
            item.val = '${item.val}kWh'; 
            break;
          case 'CHARGED_TODAY':
            item.key = i18ns.chargedToday;
            item.val = '${item.val}kWh'; 
            break;
          case 'BATTERY_STATUS':
            item.key = i18ns.batteryStatus;
            if (item.val == '0') {
              item.val = '未采集';
            } else {
              item.val = '${item.val!.split(';').join('[')}%]';
            } 
            break;
          case 'DISCHARGED_TODAY':
            item.key = i18ns.dischargedToday;
            item.val = '${item.val}kWh'; 
            break;
        }
      }
      sourceData.addAll(keyValData);
      itemData = sourceData;
    });
  }

  List<Widget> get rightItems {
   if (itemData.isEmpty) {
    List<Widget> result = [];
    for (int i = 0; i < 5; i++) {
      result.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 2.5),
        padding: const EdgeInsets.symmetric(vertical: 6.6),
        color: Colors.grey.withOpacity(.2),
      ));
    }
    return result;
   }
   return itemData.map((item) => rowItem(item.key, item.val, item.widgetVal)).toList();
  }

  Widget rowItem (String label, String? value, Widget? widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: const EdgeInsets.only(right: 10), child: Text(label)),
        Expanded(child: widget ?? Text(value ?? '', overflow: TextOverflow.ellipsis, textAlign: TextAlign.right))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.data.id != null) {
          Application.navigateTo(
            context, Routes.powerStationDetail,
            params: {'id': widget.data.id, 'name': widget.data.name, 'currentIndex': 2}
          );
        } else {
          Fluttertoast.showToast(msg: '电站ID不能为空');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(.4),
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 100,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/${widget.data.status == 0 ?'batteryP' : 'pvbattery'}.jpg")
                )
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 6),
                alignment: Alignment.topCenter,
                child: Text(
                  '${widget.data.nominalPower}kWh',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: rightItems,
              ),
            )  
          ]
        ),
      )
    );
  }
}