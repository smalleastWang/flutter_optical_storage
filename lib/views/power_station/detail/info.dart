import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/models/api/power_station/weather_model.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';

/// 电站信息
class PowerStationInfo extends StatefulWidget {
  final int id;
  const PowerStationInfo(this.id, {Key? key}) : super(key: key);

  @override
  State<PowerStationInfo> createState() => _PowerStationInfoState();
}

class _PowerStationInfoState extends State<PowerStationInfo> {

  PowerStationModel? detail;
  Now? nowWeather;
  F2? f1;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    List<PowerStationModel> detailList = await PowerStationApi.fetchListApi({'id': widget.id});
    WeatherModel weatherRes = await PowerStationApi.fetchWeatherApi({'lon': detailList.first.lon, 'lat': detailList.first.lat});
    setState(() {
      detail = detailList.first;
      nowWeather = weatherRes.showapiResBody!.now;
      f1 = weatherRes.showapiResBody!.f1;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (nowWeather == null || nowWeather!.weatherPic == null || f1 == null || detail == null) return const LoadingWidget();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/stationMsg.jpg'),
                fit: BoxFit.cover
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Image(image: NetworkImage(nowWeather!.weatherPic!), width: 60,)
                    ),
                    Row(
                      children: [
                        Text(nowWeather!.temperature!, style: const TextStyle(fontSize: 42),),
                        Container(
                          height: 45,
                          alignment: Alignment.topLeft,
                          child: const Text('°C'),
                        ),
                        Container(
                          height: 32,
                          alignment: Alignment.bottomLeft,
                          child: Text('${nowWeather!.weather!}(实时)'),
                        ),
                      ],
                    ),
                    Text('${f1!.nightAirTemperature}-${f1!.dayAirTemperature}°C'),
                    Text(nowWeather!.windDirection! + nowWeather!.windPower!),
                  ],
                ),
                Text('更新时间: ${nowWeather!.temperatureTime!}'),
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: const BoxDecoration(color: Color(0xFFE8F5E9)),
            child: Row(children: const [Text('电站信息', style: TextStyle(fontSize: 16))]),
          ),
          _RowInfo(label: '电站名称', value: detail!.name!, color: 0xFFF5F5F5),
          _RowInfo(label: '安装日期', value: detail!.installTime!),
          _RowInfo(label: '装机容量', value: '${detail!.nominalPower}kW', color: 0xFFF5F5F5),
          _RowInfo(label: '设计厂商', value: detail!.designCompany!),
          _RowInfo(label: '所在地址', value: detail!.address!, color: 0xFFF5F5F5),
          _RowInfo(label: '时区', value: '(GMT +${int.parse(detail!.timezone!) < 10 ? '0' : ''}${detail!.timezone}:00)'),
          _RowInfo(label: '经度', value: detail!.lon!, color: 0xFFF5F5F5),
          _RowInfo(label: '纬度', value: detail!.lat!),
          _RowInfo(label: '资金收益', value: detail!.profitMoney!, color: 0xFFF5F5F5),
          _RowInfo(label: '币种', value: detail!.moneyType!),
          _RowInfo(label: '节省标准煤(kg)', value: detail!.profitCoal!, color: 0xFFF5F5F5),
          _RowInfo(label: '二氧化碳减排(kg)', value: detail!.profitCo2!),
          _RowInfo(label: '二氧化硫减排(kg)', value: detail!.profitSo2!, color: 0xFFF5F5F5),
          
        ],
      ),
    );
    // return FutureBuilder<HomeEnergyModel>(
    //   future: energyData,
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) return const LoadingWidget();
    //     HomeEnergyModel data = snapshot.data!;
    //     return SingleChildScrollView(
    //       child: Column(
    //         children: [
    //         ],
    //       )
    //     );
    //   }
    // );
  }
}



class _RowInfo extends StatelessWidget {
  final String label;
  final String value;
  final int? color;
  const _RowInfo({Key? key, required this.label, required this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(color: Color(color ?? 0xFFFFFFFF)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}