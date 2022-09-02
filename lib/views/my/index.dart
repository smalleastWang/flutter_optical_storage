import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String account = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      account = prefs.getString('account') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Column(
      children: [
        _MyHeaderWidget(account: account),
        _MyItemWidget(icon: Icons.info_outline, title: i18ns.setting1, onTap: () => Navigator.pushReplacementNamed(context, Routes.about)),
        _MyItemWidget(icon: Icons.lock_outline, title: i18ns.setting2, onTap: () => Navigator.pushReplacementNamed(context, Routes.changePassword)),
        _MyItemWidget(icon: Icons.logout, title: i18ns.setting3, onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
           await prefs.clear();
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, Routes.login);
        })
      ],
    );
  }
}

class _MyHeaderWidget extends StatelessWidget {
  final String account;
  const _MyHeaderWidget({Key? key, required this.account}) : super(key: key);

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
              const Text('微信用户'),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text('@')),
              Text(account),
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