class HomeEnergyModel {
  num? batteryPower;
  num? cost;
  num? crestCharged;
  num? crestDischarged;
  num? dayCharged;
  num? dayDischarged;
  num? gridPower;
  num? income;
  String? key;
  num? loadPower;
  num? monthCharged;
  num? monthDischarged;
  String? nominal;
  num? normalCharged;
  num? normalDischarged;
  num? peakCharged;
  num? peakDischarged;
  num? profit;
  num? pvPower;
  num? soc;
  num? totalCharged;
  num? totalDischarged;
  bool? valid;
  num? valleyCharged;
  num? valleyDischarged;
  num? yearCharged;
  num? yearDischarged;

  HomeEnergyModel(
      {this.batteryPower,
      this.cost,
      this.crestCharged,
      this.crestDischarged,
      this.dayCharged,
      this.dayDischarged,
      this.gridPower,
      this.income,
      this.key,
      this.loadPower,
      this.monthCharged,
      this.monthDischarged,
      this.nominal,
      this.normalCharged,
      this.normalDischarged,
      this.peakCharged,
      this.peakDischarged,
      this.profit,
      this.pvPower,
      this.soc,
      this.totalCharged,
      this.totalDischarged,
      this.valid,
      this.valleyCharged,
      this.valleyDischarged,
      this.yearCharged,
      this.yearDischarged});

  HomeEnergyModel.fromJson(Map<String, dynamic> json) {
    batteryPower = json['batteryPower'];
    cost = json['cost'];
    crestCharged = json['crestCharged'];
    crestDischarged = json['crestDischarged'];
    dayCharged = json['dayCharged'];
    dayDischarged = json['dayDischarged'];
    gridPower = json['gridPower'];
    income = json['income'];
    key = json['key'];
    loadPower = json['loadPower'];
    monthCharged = json['monthCharged'];
    monthDischarged = json['monthDischarged'];
    nominal = json['nominal'];
    normalCharged = json['normalCharged'];
    normalDischarged = json['normalDischarged'];
    peakCharged = json['peakCharged'];
    peakDischarged = json['peakDischarged'];
    profit = json['profit'];
    pvPower = json['pvPower'];
    soc = json['soc'];
    totalCharged = json['totalCharged'];
    totalDischarged = json['totalDischarged'];
    valid = json['valid'];
    valleyCharged = json['valleyCharged'];
    valleyDischarged = json['valleyDischarged'];
    yearCharged = json['yearCharged'];
    yearDischarged = json['yearDischarged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batteryPower'] = batteryPower;
    data['cost'] = cost;
    data['crestCharged'] = crestCharged;
    data['crestDischarged'] = crestDischarged;
    data['dayCharged'] = dayCharged;
    data['dayDischarged'] = dayDischarged;
    data['gridPower'] = gridPower;
    data['income'] = income;
    data['key'] = key;
    data['loadPower'] = loadPower;
    data['monthCharged'] = monthCharged;
    data['monthDischarged'] = monthDischarged;
    data['nominal'] = nominal;
    data['normalCharged'] = normalCharged;
    data['normalDischarged'] = normalDischarged;
    data['peakCharged'] = peakCharged;
    data['peakDischarged'] = peakDischarged;
    data['profit'] = profit;
    data['pvPower'] = pvPower;
    data['soc'] = soc;
    data['totalCharged'] = totalCharged;
    data['totalDischarged'] = totalDischarged;
    data['valid'] = valid;
    data['valleyCharged'] = valleyCharged;
    data['valleyDischarged'] = valleyDischarged;
    data['yearCharged'] = yearCharged;
    data['yearDischarged'] = yearDischarged;
    return data;
  }
}
