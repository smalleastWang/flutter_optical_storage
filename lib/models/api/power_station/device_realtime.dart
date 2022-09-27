class PowerDeviceRealtimeDataModel {
  num? baseInfo;
  String? currentTime;
  List<MeanArray>? meanArray;
  num? rawValue;
  bool? saveHistory;
  num? saveInterval;
  String? signalFormat;
  num? signalId;
  String? signalName;
  String? signalType;
  String? signalUnit;
  String? signalValue;

  PowerDeviceRealtimeDataModel(
      {this.baseInfo,
      this.currentTime,
      this.meanArray,
      this.rawValue,
      this.saveHistory,
      this.saveInterval,
      this.signalFormat,
      this.signalId,
      this.signalName,
      this.signalType,
      this.signalUnit,
      this.signalValue});

  PowerDeviceRealtimeDataModel.fromJson(Map<String, dynamic> json) {
    baseInfo = json['baseInfo'];
    currentTime = json['currentTime'];
    if (json['meanArray'] != null) {
      meanArray = <MeanArray>[];
      json['meanArray'].forEach((v) {
        meanArray!.add(MeanArray.fromJson(v));
      });
    }
    rawValue = json['rawValue'];
    saveHistory = json['saveHistory'];
    saveInterval = json['saveInterval'];
    signalFormat = json['signalFormat'];
    signalId = json['signalId'];
    signalName = json['signalName'];
    signalType = json['signalType'];
    signalUnit = json['signalUnit'];
    signalValue = json['signalValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['baseInfo'] = baseInfo;
    data['currentTime'] = currentTime;
    if (meanArray != null) {
      data['meanArray'] = meanArray!.map((v) => v.toJson()).toList();
    }
    data['rawValue'] = rawValue;
    data['saveHistory'] = saveHistory;
    data['saveInterval'] = saveInterval;
    data['signalFormat'] = signalFormat;
    data['signalId'] = signalId;
    data['signalName'] = signalName;
    data['signalType'] = signalType;
    data['signalUnit'] = signalUnit;
    data['signalValue'] = signalValue;
    return data;
  }
}

class MeanArray {
  String? compareValue;
  String? deviceID;
  num? fRecno;
  num? gateID;
  String? message;

  MeanArray(
      {this.compareValue,
      this.deviceID,
      this.fRecno,
      this.gateID,
      this.message});

  MeanArray.fromJson(Map<String, dynamic> json) {
    compareValue = json['compareValue'];
    deviceID = json['deviceID'];
    fRecno = json['f_recno'];
    gateID = json['gateID'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['compareValue'] = compareValue;
    data['deviceID'] = deviceID;
    data['f_recno'] = fRecno;
    data['gateID'] = gateID;
    data['message'] = message;
    return data;
  }
}
