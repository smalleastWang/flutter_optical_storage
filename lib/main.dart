
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
import 'package:flutter_optical_storage/store/root.dart';
import 'package:flutter_optical_storage/store/power_station.dart';
import 'package:flutter_optical_storage/utils/sp_util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http/service_manager.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PowerStationStore()),
        ChangeNotifierProvider(create: (context) => RootStore()),
      ],
      child: const MyApp(),
    ),
  );
  SpUtil.getInstance();
  ServiceManager().registeredService(CustomService());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? domain = prefs.getString('domain');
  if (domain != null) {
    ServiceManager().registeredService(CustomService(domain: domain));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return Consumer<RootStore>(
      builder: (context, rootStore, child) {
        return MaterialApp(
          onGenerateTitle: (context) {
            AppLocalizations local = AppLocalizations.of(context);
            // Const.lang = local.languageCode;
            return local.appName;
          },
          locale: rootStore.currLocale,
          localizationsDelegates: const [
            APPLocalizationDelegate(),
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: I18n.languages().map((lang) => Locale(lang, '')).toList(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Application.router.generator,
          home: const LoginPage(),
          // home: const MyWidget(),
          builder: EasyLoading.init(),
        ); 
      }
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
    // Locale myLocale = Localizations.localeOf(context);
    AppLocalizations i18ns = AppLocalizations.of(context);
    List<TabWidget> tabs = [
      TabWidget(Icons.home, i18ns.tab1, i18ns.appName, const HomePage()),
      TabWidget(Icons.battery_charging_full_outlined, i18ns.tab2, i18ns.plants13, const PowerStationPage()),
      TabWidget(Icons.crisis_alert, i18ns.tab3, i18ns.plants9, const AlertPage()),
      TabWidget(Icons.person, i18ns.tab4, i18ns.setting4, const MyPage()),
    ];
    return Scaffold(
      appBar: AppBar(
        // title: Text(tabs[_currentIndex].title),
        title: Consumer<RootStore>(
          builder: (context, rootStore, child) {
            if (tabs[_currentIndex].title == i18ns.tab3 && rootStore.alertTitle.isNotEmpty) {
              return Text('${tabs[_currentIndex].title}-${rootStore.alertTitle}');
            }
            return Text(tabs[_currentIndex].title);
          },
        ),
        elevation: 0,
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
