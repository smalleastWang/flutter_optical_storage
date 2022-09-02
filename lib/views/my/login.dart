import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/api/my.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/login_model.dart';
import 'package:flutter_optical_storage/models/api/user_info.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/routes.dart';
import 'package:flutter_optical_storage/utils/styles.dart';
import 'package:flutter_optical_storage/widgets/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool isShow = false; // 0 获取状态中 1 未登录 2 已登录

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
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
    LoginDatModel dat = await MyApi.fetchLoginApi({ "account": _unameController.text, "passwd": sha1.convert(utf8.encode(_pwdController.text)).toString()});
    if (dat.userid != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('account', _unameController.text);
      await prefs.setString('userId', dat.userid ?? '');
      UserInfoModel userInfo = await MyApi.fetchUserInfoApi();
      prefs.setString('userInfo', json.encode(userInfo));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      Fluttertoast.showToast(msg: '接口返回userId为空');
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations i18ns = AppLocalizations.of(context);
    if (!isShow) return const LoadingWidget();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).login),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Form(
          key: _formKey,
          child: Column(
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
                  prefixIcon: const Icon(Icons.lock)
                ),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
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