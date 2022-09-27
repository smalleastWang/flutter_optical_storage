class PowerDeviceRemoteCtrlModel {
  String? cmdName;
  int? cmdToken;
  int? cmdType;
  String? defValue;
  String? deviceId;
  int? gateId;
  String? maxValue;
  String? minValue;

  PowerDeviceRemoteCtrlModel(
      {this.cmdName,
      this.cmdToken,
      this.cmdType,
      this.defValue,
      this.deviceId,
      this.gateId,
      this.maxValue,
      this.minValue});

  PowerDeviceRemoteCtrlModel.fromJson(Map<String, dynamic> json) {
    cmdName = json['cmdName'];
    cmdToken = json['cmdToken'];
    cmdType = json['cmdType'];
    defValue = json['defValue'];
    deviceId = json['deviceId'];
    gateId = json['gateId'];
    maxValue = json['maxValue'];
    minValue = json['minValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmdName'] = cmdName;
    data['cmdToken'] = cmdToken;
    data['cmdType'] = cmdType;
    data['defValue'] = defValue;
    data['deviceId'] = deviceId;
    data['gateId'] = gateId;
    data['maxValue'] = maxValue;
    data['minValue'] = minValue;
    return data;
  }
}
