import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/api/common_api.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/router/public.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _comfirmPwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();


  handlesSubmit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userId') == null) return Fluttertoast.showToast(msg: 'userId不能为空');
    if (prefs.getString('account') == null) return Fluttertoast.showToast(msg: '用户名不能为空');
    //验证通过提交数据
    Map<String, dynamic> query = {
      "action": "mdpwd",
      "userid": prefs.get('userId'),
      "user": prefs.get('account'),
      "oldpwd": sha1.convert(utf8.encode(_oldController.text)).toString(),
      "newpwd": sha1.convert(utf8.encode(_pwdController.text)).toString()
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
    AppLocalizations i18ns = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i18ns.setting2),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _oldController,
                decoration: const InputDecoration(
                  labelText: "原密码",
                  hintText: "请输入原密码",
                  prefixIcon: Icon(Icons.lock)
                ),
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  labelText: "新密码",
                  hintText: "请输入新密码",
                  prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
                //校验密码
                validator: (v) {
                  if (_comfirmPwdController.text != v) "两次输入的密码不一致";
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              TextFormField(
                controller: _comfirmPwdController,
                decoration: const InputDecoration(
                  labelText: "重复新密码",
                  hintText: "请重复输入新密码",
                  prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
                //校验密码
                validator: (v) {
                  if (_pwdController.text != v) "两次输入的密码不一致";
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
                          child: Text("确定", style: TextStyle(fontSize: 18)),
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