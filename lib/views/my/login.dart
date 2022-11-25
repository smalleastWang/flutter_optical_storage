import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_optical_storage/api/my.dart';
import 'package:flutter_optical_storage/http/service_manager.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/i18n/i18n.dart';
import 'package:flutter_optical_storage/models/api/login_model.dart';
import 'package:flutter_optical_storage/models/api/user_info.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:flutter_optical_storage/service/custom_service.dart';
import 'package:flutter_optical_storage/store/root.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


Map<String, String> langs= {
  'zh': '中文',
  'en': 'English',
  // 'rus': 'Russian'
};
List<String> domains = [
  'https://solaremsglobal.com',
  'https://solarweb.com.cn',
  'https://szborui.group'
];

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool isShow = false;
  bool pwdVisible = false;
  String _lang = 'zh';
  String _domain = domains[0];

  void _handleRadioChanged(String? value) {
    setState(() {
      _lang = value!;
    });
  }
  void _handleDomainChanged(String? domain) {
    setState(() {
      _domain = domain!;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    RootStore localeStore = Provider.of<RootStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? localLang = prefs.getString('lang');
    // 判断本地存储语言并修改语言
    if (localLang != null) {
      localeStore.setLocale(localLang);
    }
    // 用户
    if (userId == null || userId == '') {
      setState(() {
        isShow = true;
      });
      return;
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, Routes.home);
  }
  
  handlesSubmit() async {
    // 设置域名
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('domain', _domain);
    ServiceManager().registeredService(CustomService(domain: _domain));
    // ignore: use_build_context_synchronously
    RootStore localeStore = Provider.of<RootStore>(context, listen: false);
    // ignore: use_build_context_synchronously
    AppLocalizations i18ns = AppLocalizations.of(context);
    LoginDatModel dat = await MyApi.fetchLoginApi({ "account": _unameController.text, "passwd": sha1.convert(utf8.encode(_pwdController.text)).toString()}, i18ns);
    if (dat.userid != null) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('account', _unameController.text);
      await prefs.setString('userId', dat.userid ?? '');
      UserInfoModel userInfo = await MyApi.fetchUserInfoApi();
      if (userInfo.sysrole?.rolepower != null) {
        prefs.setInt('rolepower', userInfo.sysrole?.rolepower as int);
      }
      prefs.setString('userInfo', json.encode(userInfo));
      Fluttertoast.showToast(msg: '登录成功');
      // 存储和设置语言
      prefs.setString('lang', _lang);
      localeStore.setLocale(_lang);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      Fluttertoast.showToast(msg: '接口返回userId为空');
    }
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    if (_lang == '') {
      setState(() {
        _lang = myLocale.languageCode;
      });
    }
    AppLocalizations i18ns = AppLocalizations.of(context);
    if (!isShow) return const LoadingWidget();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text(AppLocalizations.of(context).login),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: const Image(
                  // width: 200,
                  image: AssetImage("assets/images/main.png")
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                    border: const OutlineInputBorder(),
                    // labelText: i18ns.logNote,
                    hintText: i18ns.logNote,
                    prefixIcon: const Icon(Icons.person)
                  ),
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  },
                )
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  border: const OutlineInputBorder(),
                  // labelText: "密码",
                  hintText: i18ns.loginNote2,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                  icon: Icon(pwdVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () { 
                    setState(() {
                      pwdVisible = !pwdVisible;
                    });
                   },
                ),
                ),
                obscureText: !pwdVisible,
                //校验密码
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              // Row(
              //   children: [
              //     const Text('语言'),
              //     const SizedBox(width: 10),
              //     DropdownButton(
              //       hint: const Text('请选择语言'),
              //       items: I18n.languages().map((lang) => DropdownMenuItem(
              //         value: lang,
              //         child: Text(langs[lang] ?? ''),
              //       )).toList(),
              //       value: _lang,
              //       onChanged: _handleRadioChanged,
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Text('语言'),
                    const SizedBox(width: 15),
                    DropdownButton(
                      value: _lang,
                      items: I18n.languages().map((lang) => DropdownMenuItem(value: lang, child: Text(langs[lang] ?? ''))).toList(),
                      onChanged: _handleRadioChanged,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Text('服务器'),
                  const SizedBox(width: 15),
                  DropdownButton(
                    value: _domain,
                    items: domains.map((domain) => DropdownMenuItem(value: domain, child: Text(domain))).toList(),
                    onChanged: _handleDomainChanged,
                  )
                ],
              ),
              
              // Row(
              //   children: I18n.languages().map((lang) => Row(
              //     children: [
              //       Radio(
              //         value: lang,
              //         groupValue: _lang,
              //         onChanged: _handleRadioChanged,
              //       ),
              //       Text(langs[lang] ?? ''),
              //       const SizedBox(width: 10),
              //     ],
              //   )).toList(),
              // ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(i18ns.login, style: const TextStyle(fontSize: 18)),
                        ),
                        onPressed: () async {
                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            handlesSubmit();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}