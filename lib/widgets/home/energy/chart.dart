import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';

class HomeChartWidget extends StatelessWidget {
  final HomeEnergyModel data;
  const HomeChartWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ItemWidget(imgName: 'grid', label: '电网', value: data.gridPower.toString(), color: Colors.red,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ItemWidget(imgName: 'pv1', label: '光伏', value: '0', color: Colors.green),
              _ItemWidget(imgName: 'ems2', label: '储能', value: data.batteryPower.toString(), color: Colors.amber.shade800)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ItemWidget(imgName: 'load', label: '负载', value: data.loadPower.toString(), color: Colors.blue,)
            ],
          ),
        ]
      ),
    );
  }
}


class _ItemWidget extends StatelessWidget {
  final String imgName;
  final String label;
  final String value;
  final Color color;
  const _ItemWidget({Key? key, required this.imgName, required this.label, required this.value, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(120))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/$imgName.png')),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text('$label(kW)', style: const TextStyle(color: Colors.white, fontSize: 12))
        ],
      ),
    );
  }
}