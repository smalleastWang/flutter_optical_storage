
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';


class HomeGridWidget extends StatelessWidget {
  final HomeEnergyModel data;
  const HomeGridWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'charge1', label: '今日充电量', color: 0xFF477DF0, value: data.dayCharged.toString()),
            _ItemWidget( imgName: 'charge2', label: '累计充电量', color: 0xFF477DF0, value: data.totalCharged.toString()),
          ]
        ),
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'discharge1', label: '今日放电量', color: 0xFF477DF0, value: data.dayDischarged.toString()),
            _ItemWidget( imgName: 'discharge2', label: '累计放电量', color: 0xFF477DF0, value: data.totalDischarged.toString()),
          ],
        ),
        const _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'charge1', label: '当日发电', color: 0xFF477DF0, value: '0.0'),
            _ItemWidget( imgName: 'charge2', label: '累计发电', color: 0xFF477DF0, value: '0.0'),
          ],
        )
      ],
    );
  }
}


class _RowItemWidget extends StatelessWidget {
  final List<Widget> children;
  const _RowItemWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
            width: 0.6,//宽度
            color: Colors.grey, //边框颜色
          ),
        ),
      ),
      child: Row(
        children: children,
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String imgName;
  final String label;
  final int color;
  final String? value;
  const _ItemWidget({Key? key, required this.imgName, required this.label, required this.color, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            width: 36,
            image: AssetImage('assets/images/$imgName.png')
          ),
          Column(
            children: [
              // 今日充电量 todayCharged
              Text('$label(kWh)', style: const TextStyle(fontSize: 16)),
              Text(value!, style: TextStyle(color: Color(color), fontSize: 16))
            ],
          )
        ],
      )
    );
  }
}