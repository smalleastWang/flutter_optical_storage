
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/power_station.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeviceDetail extends StatelessWidget {
  final String deviceId;
  final String name;
  final String addr;
  final String loggerNum;
  const DeviceDetail({Key? key, required this.deviceId, required this.name, required this.addr, required this.loggerNum}) : super(key: key);

  handleRefresh(BuildContext context) async {
    AppLocalizations i18ns = AppLocalizations.of(context);
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(i18ns.warn7),
          content: Text(i18ns.ctrlNote8),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(.5))
              ),
              child: SizedBox(
                width: 100,
                child: Text(i18ns.cancel, textAlign: TextAlign.center)
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> res = await PowerStationApi.fetchRefreshDeviceDataApi({'devcode': deviceId});
                if (res['err'] == 0) {
                  Fluttertoast.showToast(msg: i18ns.ctrlNote5);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } else {
                  Fluttertoast.showToast(msg: i18ns.error2);
                }
              },
              child: SizedBox(
                width: 100,
                child: Text(i18ns.ok, textAlign: TextAlign.center)
              ),
            ),
          ],
        );
      },
    );
  }
  postRefresh() async {
    await PowerStationApi.fetchRefreshDeviceDataApi({'devcode': deviceId });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
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
                  Text('${i18ns.devCode}$deviceId', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15)),
                  Text('${i18ns.devAddress}$addr', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15)),
                  Text('${i18ns.loggerNumber}$loggerNum', style: const TextStyle(color: Colors.white, height: 2, fontSize: 15))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => handleRefresh(context),
                child: const Icon(Icons.refresh_rounded, color: Colors.white, size: 32)
              )
              
            ]
          )
        ],
      ),
    );
  }
}