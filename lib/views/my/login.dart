import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/models/api/login_model.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:flutter_optical_storage/router/routes.dart';
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

  handlesSubmit() async {
    //验证通过提交数据
    Map<String, dynamic> query = {
      "action": "login",
      "account": _unameController.text,
      "passwd": sha1.convert(utf8.encode(_pwdController.text)).toString()
    };
    CommonApi().request(
      query: query,
      successCallBack: (data) async {
        LoginModel loginRes = LoginModel.fromJson(data);
        if (loginRes.err == 0) {
          if (loginRes.dat!.userid != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('account', _unameController.text);
            await prefs.setString('userId', loginRes.dat!.userid ?? '');
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, Routes.home);
          } else {
            Fluttertoast.showToast(msg: '接口返回userId为空');
          }
        } else if (loginRes.err == 23) {
          return Fluttertoast.showToast(msg: '帐号被锁定');
        } else if (loginRes.err == 8) {
          return Fluttertoast.showToast(msg: '用户名或密码错误');
        } else if (loginRes.err == 2) {
          return Fluttertoast.showToast(msg: '帐号不存在');
        } else {
          return Fluttertoast.showToast(msg: '未知错误');
        }
      },
      errorCallBack: (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
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
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: const InputDecoration(
                  labelText: "帐号",
                  hintText: "手机号/用户名/邮箱",
                  prefixIcon: Icon(Icons.person)
                ),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  prefixIcon: Icon(Icons.lock)
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
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("登录", style: TextStyle(fontSize: 18)),
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
    );
  }
}