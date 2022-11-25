import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String version = '';

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Column(
      children: [
        _MyHeaderWidget(version: version),
        _MyItemWidget(icon: Icons.info_outline, title: i18ns.setting1, onTap: () => Navigator.pushNamed(context, Routes.about)),
        _MyItemWidget(icon: Icons.lock_outline, title: i18ns.setting2, onTap: () => Navigator.pushNamed(context, Routes.changePassword)),
        _MyItemWidget(icon: Icons.logout, title: i18ns.setting3, onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
           await prefs.clear();
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, Routes.login);
        })
      ],
    );
  }
}

class _MyHeaderWidget extends StatelessWidget {
  final String version;
  const _MyHeaderWidget({Key? key, required this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 42, bottom: 10),
            child: Image(
              width: 100,
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('SolarEMS'),
              Text(version),
            ],
          )
        ],
      ),
    );
  }
}


class _MyItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;
  const _MyItemWidget({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon),
            Text(' $title', style: const TextStyle(fontSize: 16)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [Icon(Icons.chevron_right)],
              )
            )
          ],
        ),
      ),
    );
  }
}