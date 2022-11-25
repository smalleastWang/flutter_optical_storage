
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/home/energy_model.dart';
import 'package:flutter_optical_storage/models/api/home/photovoltaic_model.dart';


class HomeGridWidget extends StatelessWidget {
  final HomeEnergyModel data;
  final String type;
  const HomeGridWidget(this.data, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Column(
      children: [
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'charge1', label: i18ns.chargedDay, color: 0xFF477DF0, value: data.dayCharged.toString()),
            _ItemWidget( imgName: 'charge2', label: i18ns.chargedTotal, color: 0xFF477DF0, value: data.totalCharged.toString()),
          ]
        ),
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'discharge1', label: i18ns.dischargedDay, color: 0xFF477DF0, value: data.dayDischarged.toString()),
            _ItemWidget( imgName: 'discharge2', label: i18ns.dischargedTotal, color: 0xFF477DF0, value: data.totalDischarged.toString()),
          ],
        ),
        type == 'home' ? 
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'charge1', label: i18ns.home3, color: 0xFF477DF0, value: '0.0'),
            _ItemWidget( imgName: 'charge2', label: i18ns.home6, color: 0xFF477DF0, value: '0.0'),
          ],
        ) : Container()
      ],
    );
  }
}

class HomeGridPhotovoltaicWidget extends StatelessWidget {
  final HomePhotovoltaicModel data;
  final String type;
  const HomeGridPhotovoltaicWidget(this.data, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Column(
      children: [
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'createToday', label: i18ns.home3, color: 0xFF477DF0, value: data.todayEnergy),
            _ItemWidget( imgName: 'createMonth', label: i18ns.home4, color: 0xFF477DF0, value: data.monthEnergy),
          ]
        ),
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'createYear', label: i18ns.home5, color: 0xFF477DF0, value: data.yearEnergy),
            _ItemWidget( imgName: 'createTotal', label: i18ns.home6, color: 0xFF477DF0, value: data.totalEnergy),
          ],
        ),
        type == 'home' ? 
        _RowItemWidget(
          children: [
            _ItemWidget( imgName: 'getTotal', label: i18ns.home7, color: 0xFF477DF0, value: data.money),
            _ItemWidget( imgName: 'todayCO2', label: i18ns.home8, color: 0xFF477DF0, value: data.cO2Reduced),
          ],
        ) : Container()
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
              SizedBox(
                width: 140,
                child: Text(
                  label, 
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(value!, style: TextStyle(color: Color(color), fontSize: 16))
            ],
          )
        ],
      )
    );
  }
}