// ignore_for_file: unnecessary_this

class AlertItemModel {
  String? deviceID;
  String? devname;
  String? devtype;
  String? disappearTime;
  String? eventID;
  int? eventLevel;
  int? fRecno;
  int? handle;
  String? message;
  String? startTime;

  AlertItemModel(
      {this.deviceID,
      this.devname,
      this.devtype,
      this.disappearTime,
      this.eventID,
      this.eventLevel,
      this.fRecno,
      this.handle,
      this.message,
      this.startTime});

  AlertItemModel.fromJson(Map<String, dynamic> json) {
    deviceID = json['deviceID'];
    devname = json['devname'];
    devtype = json['devtype'];
    disappearTime = json['disappearTime'];
    eventID = json['eventID'];
    eventLevel = json['eventLevel'];
    fRecno = json['f_recno'];
    handle = json['handle'];
    message = json['message'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceID'] = this.deviceID;
    data['devname'] = this.devname;
    data['devtype'] = this.devtype;
    data['disappearTime'] = this.disappearTime;
    data['eventID'] = this.eventID;
    data['eventLevel'] = this.eventLevel;
    data['f_recno'] = this.fRecno;
    data['handle'] = this.handle;
    data['message'] = this.message;
    data['startTime'] = this.startTime;
    return data;
  }
}
