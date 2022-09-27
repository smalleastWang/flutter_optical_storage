class PowerDeviceLoggerScheduleModel {
  int? actType;
  int? cmdNo;
  String? endTime;
  int? id;
  String? name;
  int? period;
  double? price;
  int? rateAttr;
  String? schePower;
  String? serialNum;
  String? startTime;

  PowerDeviceLoggerScheduleModel(
      {this.actType,
      this.cmdNo,
      this.endTime,
      this.id,
      this.name,
      this.period,
      this.price,
      this.rateAttr,
      this.schePower,
      this.serialNum,
      this.startTime});

  PowerDeviceLoggerScheduleModel.fromJson(Map<String, dynamic> json) {
    actType = json['actType'];
    cmdNo = json['cmdNo'];
    endTime = json['endTime'];
    id = json['id'];
    name = json['name'];
    period = json['period'];
    price = json['price'];
    rateAttr = json['rateAttr'];
    schePower = json['schePower'];
    serialNum = json['serialNum'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['actType'] = actType;
    data['cmdNo'] = cmdNo;
    data['endTime'] = endTime;
    data['id'] = id;
    data['name'] = name;
    data['period'] = period;
    data['price'] = price;
    data['rateAttr'] = rateAttr;
    data['schePower'] = schePower;
    data['serialNum'] = serialNum;
    data['startTime'] = startTime;
    return data;
  }
}
