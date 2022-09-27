
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/enums/Colors.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/common/enums.dart';

class PowerStationStatusWidget extends StatelessWidget {
  final int status;
  const PowerStationStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    EnumsModel data = EnumsModel(color: StatusColor.def, title: '');
    switch (status) {
      case 0: data = EnumsModel(color: StatusColor.success, title: i18ns.plants8); break;
      case 1: data = EnumsModel(color: StatusColor.warnning, title: i18ns.plants9); break;
      case 2: data = EnumsModel(color: StatusColor.error, title: i18ns.plants10); break;
      case 3: data = EnumsModel(color: StatusColor.def, title: i18ns.plants11); break;
      case 4: data = EnumsModel(color: StatusColor.def, title: i18ns.plants12); break;
    }
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: data.color,
          borderRadius: BorderRadius.circular(4)
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Text(data.title!, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}