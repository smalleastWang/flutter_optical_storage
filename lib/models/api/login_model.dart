class LoginModel {
  int? err;
  LoginDatModel? dat;

  LoginModel({this.err, this.dat});

  LoginModel.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    if (json['dat'] is Map) {
      dat = LoginDatModel.fromJson(json['dat']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    if (dat != null) {
      data['dat'] = dat!.toJson();
    }
    return data;
  }
}

class LoginDatModel {
  String? userid;
  int? role;
  String? pwdsha1;
  String? token;
  int? expire;

  LoginDatModel({this.userid, this.role, this.pwdsha1, this.token, this.expire});

  LoginDatModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    role = json['role'];
    pwdsha1 = json['pwdsha1'];
    token = json['token'];
    expire = json['expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['role'] = role;
    data['pwdsha1'] = pwdsha1;
    data['token'] = token;
    data['expire'] = expire;
    return data;
  }
}