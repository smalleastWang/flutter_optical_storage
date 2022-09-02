class PowerStationModel {
  String? address;
  String? designCompany;
  int? id;
  String? imageaddr;
  String? installTime;
  String? lat;
  String? loggerSN;
  String? loggerlist;
  String? lon;
  String? moneyType;
  String? name;
  String? nominalPower;
  String? nominalUnit;
  String? profitCo2;
  String? profitCoal;
  String? profitMoney;
  String? profitSo2;
  int? status;
  String? thumbnail;
  String? timezone;
  int? type;
  int? viewID;

  PowerStationModel(
      {this.address,
      this.designCompany,
      this.id,
      this.imageaddr,
      this.installTime,
      this.lat,
      this.loggerSN,
      this.loggerlist,
      this.lon,
      this.moneyType,
      this.name,
      this.nominalPower,
      this.nominalUnit,
      this.profitCo2,
      this.profitCoal,
      this.profitMoney,
      this.profitSo2,
      this.status,
      this.thumbnail,
      this.timezone,
      this.type,
      this.viewID});

  PowerStationModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    designCompany = json['designCompany'];
    id = json['id'];
    imageaddr = json['imageaddr'];
    installTime = json['installTime'];
    lat = json['lat'];
    loggerSN = json['loggerSN'];
    loggerlist = json['loggerlist'];
    lon = json['lon'];
    moneyType = json['money_type'];
    name = json['name'];
    nominalPower = json['nominal_power'];
    nominalUnit = json['nominal_unit'];
    profitCo2 = json['profit_co2'];
    profitCoal = json['profit_coal'];
    profitMoney = json['profit_money'];
    profitSo2 = json['profit_so2'];
    status = json['status'];
    thumbnail = json['thumbnail'];
    timezone = json['timezone'];
    type = json['type'];
    viewID = json['viewID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['designCompany'] = designCompany;
    data['id'] = id;
    data['imageaddr'] = imageaddr;
    data['installTime'] = installTime;
    data['lat'] = lat;
    data['loggerSN'] = loggerSN;
    data['loggerlist'] = loggerlist;
    data['lon'] = lon;
    data['money_type'] = moneyType;
    data['name'] = name;
    data['nominal_power'] = nominalPower;
    data['nominal_unit'] = nominalUnit;
    data['profit_co2'] = profitCo2;
    data['profit_coal'] = profitCoal;
    data['profit_money'] = profitMoney;
    data['profit_so2'] = profitSo2;
    data['status'] = status;
    data['thumbnail'] = thumbnail;
    data['timezone'] = timezone;
    data['type'] = type;
    data['viewID'] = viewID;
    return data;
  }
}
