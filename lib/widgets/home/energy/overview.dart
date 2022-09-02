import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeOverviewWidget extends StatelessWidget {
  final HomeEnergyModel data;
  const HomeOverviewWidget(this.data, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ItemWidget(imgName: 'soc', label: '电池剩余容量(%)', value: data.soc.toString()),
          CircularPercentIndicator(
            radius: 60,
            lineWidth: 10,
            animation: true,
            percent: data.soc! / 100,
            center:  Text(
              "${data.soc}%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.deepOrange,
            backgroundColor: Colors.white,
          ),
          _ItemWidget(imgName: 'cap', label: '电池配置容量(kWh)', value: data.nominal!)
        ],
      ),
    );
  }
}


class _ItemWidget extends StatelessWidget {
  final String imgName;
  final String label;
  final String value;
  const _ItemWidget({Key? key, required this.imgName, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('assets/images/$imgName.png')),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        Text(value, style: const TextStyle(color: Color.fromARGB(255, 241, 255, 39), fontSize: 16, height: 1.6))
      ],
    );
  }
}