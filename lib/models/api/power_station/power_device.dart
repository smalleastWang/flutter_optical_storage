class PowerDeviceModel {
  int? cmdResult;
  String? connectOK;
  int? datafetch;
  List<DeviceList>? deviceList;
  int? eventlevel;
  String? ftppasswd;
  String? ftpuser;
  int? heartbeat;
  int? id;
  String? ip;
  String? model;
  String? name;
  int? offline;
  int? online;
  int? pid;
  String? serialNum;
  int? timezone;
  int? total;
  String? type;

  PowerDeviceModel(
      {this.cmdResult,
      this.connectOK,
      this.datafetch,
      this.deviceList,
      this.eventlevel,
      this.ftppasswd,
      this.ftpuser,
      this.heartbeat,
      this.id,
      this.ip,
      this.model,
      this.name,
      this.offline,
      this.online,
      this.pid,
      this.serialNum,
      this.timezone,
      this.total,
      this.type});

  PowerDeviceModel.fromJson(Map<String, dynamic> json) {
    cmdResult = json['cmdResult'];
    connectOK = json['connectOK'];
    datafetch = json['datafetch'];
    if (json['deviceList'] != null) {
      deviceList = <DeviceList>[];
      json['deviceList'].forEach((v) {
        deviceList!.add(DeviceList.fromJson(v));
      });
    }
    eventlevel = json['eventlevel'];
    ftppasswd = json['ftppasswd'];
    ftpuser = json['ftpuser'];
    heartbeat = json['heartbeat'];
    id = json['id'];
    ip = json['ip'];
    model = json['model'];
    name = json['name'];
    offline = json['offline'];
    online = json['online'];
    pid = json['pid'];
    serialNum = json['serialNum'];
    timezone = json['timezone'];
    total = json['total'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmdResult'] = cmdResult;
    data['connectOK'] = connectOK;
    data['datafetch'] = datafetch;
    if (deviceList != null) {
      data['deviceList'] = deviceList!.map((v) => v.toJson()).toList();
    }
    data['eventlevel'] = eventlevel;
    data['ftppasswd'] = ftppasswd;
    data['ftpuser'] = ftpuser;
    data['heartbeat'] = heartbeat;
    data['id'] = id;
    data['ip'] = ip;
    data['model'] = model;
    data['name'] = name;
    data['offline'] = offline;
    data['online'] = online;
    data['pid'] = pid;
    data['serialNum'] = serialNum;
    data['timezone'] = timezone;
    data['total'] = total;
    data['type'] = type;
    return data;
  }
}

class DeviceList {
  String? addr;
  String? deviceId;
  int? deviceType;
  String? devname;
  String? loggerNum;
  int? portId;
  int? status;

  DeviceList(
      {this.addr,
      this.deviceId,
      this.deviceType,
      this.devname,
      this.loggerNum,
      this.portId,
      this.status});

  DeviceList.fromJson(Map<String, dynamic> json) {
    addr = json['addr'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
    devname = json['devname'];
    loggerNum = json['loggerNum'];
    portId = json['portId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addr'] = addr;
    data['deviceId'] = deviceId;
    data['deviceType'] = deviceType;
    data['devname'] = devname;
    data['loggerNum'] = loggerNum;
    data['portId'] = portId;
    data['status'] = status;
    return data;
  }
}
