import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/widgets/power_station/device_detail/detail.dart';
import 'package:flutter_optical_storage/widgets/power_station/device_detail/history_data.dart';
import 'package:flutter_optical_storage/widgets/power_station/device_detail/logger_schedule.dart';
import 'package:flutter_optical_storage/widgets/power_station/device_detail/realtime.dart';
import 'package:flutter_optical_storage/widgets/power_station/device_detail/remote_ctrl.dart';

class PowerDeviceDetailPage extends StatefulWidget {
  final int id;
  final String deviceId;
  final String name;
  final String addr;
  final String loggerNum;
  final int deviceType;
  const PowerDeviceDetailPage({Key? key, required this.id, required this.name, required this.addr, required this.loggerNum, required this.deviceId, required this.deviceType}) : super(key: key);

  @override
  State<PowerDeviceDetailPage> createState() => _PowerDeviceDetailPageState();
}

class _PowerDeviceDetailPageState extends State<PowerDeviceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          DeviceDetail(deviceId: widget.deviceId, name: widget.name, addr: widget.addr, loggerNum: widget.loggerNum),
          Expanded(child: _TabBarView(deviceId: widget.deviceId, loggerNum: widget.loggerNum, id: widget.id, deviceType: widget.deviceType)),
        ],
      ),
    );
  }
}

class _TabBarView extends StatefulWidget {
  final int id;
  final String deviceId;
  final String loggerNum;
  final int deviceType;
  const _TabBarView({Key? key, required this.deviceId, required this.loggerNum, required this.id, required this.deviceType}) : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<_TabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = ['历史数据', '实时数据', '远程控制'];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [
      HistoryDataWidget(id: widget.id, deviceId: widget.deviceId),
      DeviceRealtimeWidget(deviceId: widget.deviceId),
      DeviceRemoteCtrlWidget(deviceId: widget.deviceId, id: widget.id),
    ];
    if (widget.deviceType == 1) {
      tabs.removeAt(0);
      contents.removeAt(0);
      tabs.add('调度时刻表');
      contents.add(DeviceLoggerScheduleWidget(loggerNum: widget.loggerNum));
    }
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black.withOpacity(0.8),
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: contents,
          )
        )
      ],
    );
  }
  
  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}


