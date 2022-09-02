class UserInfoModel {
  String? address;
  String? email;
  int? language;
  String? logo;
  String? officeIDs;
  String? password;
  String? registDateStr;
  RegisteDate? registeDate;
  int? roleid;
  String? subusersid;
  Sysrole? sysrole;
  String? telNo;
  int? userID;
  String? userName;
  int? validate;
  String? working;

  UserInfoModel(
      {this.address,
      this.email,
      this.language,
      this.logo,
      this.officeIDs,
      this.password,
      this.registDateStr,
      this.registeDate,
      this.roleid,
      this.subusersid,
      this.sysrole,
      this.telNo,
      this.userID,
      this.userName,
      this.validate,
      this.working});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    email = json['email'];
    language = json['language'];
    logo = json['logo'];
    officeIDs = json['officeIDs'];
    password = json['password'];
    registDateStr = json['registDateStr'];
    registeDate = json['registeDate'] != null
        ? RegisteDate.fromJson(json['registeDate'])
        : null;
    roleid = json['roleid'];
    subusersid = json['subusersid'];
    sysrole =
        json['sysrole'] != null ? Sysrole.fromJson(json['sysrole']) : null;
    telNo = json['telNo'];
    userID = json['userID'];
    userName = json['userName'];
    validate = json['validate'];
    working = json['working'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['email'] = email;
    data['language'] = language;
    data['logo'] = logo;
    data['officeIDs'] = officeIDs;
    data['password'] = password;
    data['registDateStr'] = registDateStr;
    if (registeDate != null) {
      data['registeDate'] = registeDate!.toJson();
    }
    data['roleid'] = roleid;
    data['subusersid'] = subusersid;
    if (sysrole != null) {
      data['sysrole'] = sysrole!.toJson();
    }
    data['telNo'] = telNo;
    data['userID'] = userID;
    data['userName'] = userName;
    data['validate'] = validate;
    data['working'] = working;
    return data;
  }
}

class RegisteDate {
  int? date;
  int? day;
  int? hours;
  int? minutes;
  int? month;
  int? nanos;
  int? seconds;
  int? time;
  int? timezoneOffset;
  int? year;

  RegisteDate(
      {this.date,
      this.day,
      this.hours,
      this.minutes,
      this.month,
      this.nanos,
      this.seconds,
      this.time,
      this.timezoneOffset,
      this.year});

  RegisteDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    hours = json['hours'];
    minutes = json['minutes'];
    month = json['month'];
    nanos = json['nanos'];
    seconds = json['seconds'];
    time = json['time'];
    timezoneOffset = json['timezoneOffset'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day'] = day;
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['month'] = month;
    data['nanos'] = nanos;
    data['seconds'] = seconds;
    data['time'] = time;
    data['timezoneOffset'] = timezoneOffset;
    data['year'] = year;
    return data;
  }
}

class Sysrole {
  RegisteDate? addTime;
  String? addTimeStr;
  int? creator;
  String? creatorname;
  int? id;
  String? remark;
  String? rolename;
  int? rolepower;
  int? status;
  String? statusdesc;
  int? type;
  String? typedesc;

  Sysrole(
      {this.addTime,
      this.addTimeStr,
      this.creator,
      this.creatorname,
      this.id,
      this.remark,
      this.rolename,
      this.rolepower,
      this.status,
      this.statusdesc,
      this.type,
      this.typedesc});

  Sysrole.fromJson(Map<String, dynamic> json) {
    addTime = json['addTime'] != null
        ? RegisteDate.fromJson(json['addTime'])
        : null;
    addTimeStr = json['addTimeStr'];
    creator = json['creator'];
    creatorname = json['creatorname'];
    id = json['id'];
    remark = json['remark'];
    rolename = json['rolename'];
    rolepower = json['rolepower'];
    status = json['status'];
    statusdesc = json['statusdesc'];
    type = json['type'];
    typedesc = json['typedesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addTime != null) {
      data['addTime'] = addTime!.toJson();
    }
    data['addTimeStr'] = addTimeStr;
    data['creator'] = creator;
    data['creatorname'] = creatorname;
    data['id'] = id;
    data['remark'] = remark;
    data['rolename'] = rolename;
    data['rolepower'] = rolepower;
    data['status'] = status;
    data['statusdesc'] = statusdesc;
    data['type'] = type;
    data['typedesc'] = typedesc;
    return data;
  }
}
