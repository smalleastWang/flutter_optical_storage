import 'package:flutter/material.dart';

import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/menu/Tab.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/views/power_station/detail/device.dart';
import 'package:flutter_optical_storage/views/power_station/detail/info.dart';
import 'package:flutter_optical_storage/views/power_station/detail/statistics.dart';


class PowerStationDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final int currentIndex;
  const PowerStationDetailPage({Key? key, this.currentIndex = 0, this.id = 0, required this.name}) : super(key: key);

  @override
  State<PowerStationDetailPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<PowerStationDetailPage> {

  int _currentIndex = 1;

  @override
  void initState() {
    setState(() {
      if (_currentIndex != widget.currentIndex) _currentIndex = widget.currentIndex;
    });
    super.initState();
  }

  /// Tab 切换
  void onTabChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    List<TabWidget> tabs = [
      TabWidget(Icons.home, i18ns.station1, i18ns.station1, PowerStationInfo(widget.id)),
      TabWidget(Icons.battery_charging_full_outlined, i18ns.station2, i18ns.station2, PowerStatisticsPage(widget.id)),
      TabWidget(Icons.crisis_alert, i18ns.station3, i18ns.station3, PowerDevice(widget.id)),
      TabWidget(Icons.person, i18ns.videoTab, i18ns.videoTab, const MyPage()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: tabs[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabChanged,
        type: BottomNavigationBarType.fixed,
        items: tabs.map((item) => BottomNavigationBarItem(icon: Icon(item.icon),label: item.label, backgroundColor:  Colors.blue)).toList(),
      ),
    );
  }
}

