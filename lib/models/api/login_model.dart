class LoginModel {
  int? err;
  Dat? dat;

  LoginModel({this.err, this.dat});

  LoginModel.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    if (json['dat'] is Map) {
      dat = Dat.fromJson(json['dat']);
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

class Dat {
  String? userid;
  int? role;
  String? pwdsha1;
  String? token;
  int? expire;

  Dat({this.userid, this.role, this.pwdsha1, this.token, this.expire});

  Dat.fromJson(Map<String, dynamic> json) {
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
