import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_optical_storage/i18n/app_localization_delegate.dart';

import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/i18n/i18n.dart';
import 'package:flutter_optical_storage/models/menu/Tab.dart';
import 'package:flutter_optical_storage/router/application.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:flutter_optical_storage/service/custom_service.dart';
import 'package:flutter_optical_storage/utils/sp_util.dart';

import 'http/service_manager.dart';

void main() {
  // realRunApp();
  runApp(const MyApp());
  SpUtil.getInstance();
  ServiceManager().registeredService(CustomService());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      localizationsDelegates: const [
        APPLocalizationDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: I18n.languages().map((lang) => Locale(lang, '')).toList(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router!.generator,
      home: const LoginPage(),
      builder: EasyLoading.init(),
      // home: const LoginPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  final int currentIndex;
  const IndexPage({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (_currentIndex != widget.currentIndex) _currentIndex = widget.currentIndex;
    });
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
      TabWidget(Icons.home, i18ns.tab1, i18ns.appName, const HomePage()),
      TabWidget(Icons.battery_charging_full_outlined, i18ns.tab2, i18ns.plants13, const PowerStationPage()),
      TabWidget(Icons.crisis_alert, i18ns.tab3, i18ns.plants9, const AlertPage()),
      TabWidget(Icons.person, i18ns.tab4, i18ns.setting4, const MyPage()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[_currentIndex].title),
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

