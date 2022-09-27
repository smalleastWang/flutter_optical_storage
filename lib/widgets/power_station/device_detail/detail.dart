
import 'package:flutter/material.dart';

class DeviceDetail extends StatelessWidget {
  final String deviceId;
  final String name;
  final String addr;
  final String loggerNum;
  final Function? refresh;
  const DeviceDetail({Key? key, required this.deviceId, required this.name, required this.addr, required this.loggerNum, this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset('assets/images/shebei1.png', width: 90, fit: BoxFit.cover)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('设备编号：$deviceId', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15)),
                  Text('设备地址：$addr', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15)),
                  Text('所属采集器编号：$loggerNum', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15))
                ],
              )
            ],
          ),
          InkWell(
            onTap: () {
              if (refresh != null) {
                refresh!();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.refresh_rounded, color: Colors.white, size: 32),
              ]
            ),
          )
        ],
      ),
    );
  }
}