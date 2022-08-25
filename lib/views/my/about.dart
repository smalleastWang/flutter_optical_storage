import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';



extension FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i18ns.setting1),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Column(
                children: const [
                  Image(
                    width: 100,
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  Text('solarmonitor：1.8.0')
                ],
              ),
            ),
            Text(i18ns.introduction1.fixAutoLines()),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 15),
              child: Text(i18ns.introduction2.fixAutoLines()),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 4, 14 , 4),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.grey.shade800)
                    )
                  ),
                  child: const Image(
                    width: 80,
                    image: AssetImage("assets/images/qrcode.jpg"),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(i18ns.info1),
                      Text(i18ns.info2),
                    ],
                  ),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}