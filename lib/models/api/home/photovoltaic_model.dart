class HomePhotovoltaicModel {
  String? cO2Reduced;
  String? batteryPower;
  String? batteryStatus;
  String? coalReduced;
  String? gridPower;
  String? loadPower;
  String? money;
  int? monthCharged;
  int? monthDischarged;
  String? monthEnergy;
  String? oilReduced;
  String? outputPower;
  RefreshTimestap? refreshTimestap;
  int? todayCharged;
  int? todayDischarged;
  String? todayEnergy;
  int? totalCharged;
  int? totalDischarged;
  String? totalEnergy;
  int? yearCharged;
  int? yearDischarged;
  String? yearEnergy;

  HomePhotovoltaicModel(
      {this.cO2Reduced,
      this.batteryPower,
      this.batteryStatus,
      this.coalReduced,
      this.gridPower,
      this.loadPower,
      this.money,
      this.monthCharged,
      this.monthDischarged,
      this.monthEnergy,
      this.oilReduced,
      this.outputPower,
      this.refreshTimestap,
      this.todayCharged,
      this.todayDischarged,
      this.todayEnergy,
      this.totalCharged,
      this.totalDischarged,
      this.totalEnergy,
      this.yearCharged,
      this.yearDischarged,
      this.yearEnergy});

  HomePhotovoltaicModel.fromJson(Map<String, dynamic> json) {
    cO2Reduced = json['CO2Reduced'];
    batteryPower = json['batteryPower'];
    batteryStatus = json['batteryStatus'];
    coalReduced = json['coalReduced'];
    gridPower = json['gridPower'];
    loadPower = json['loadPower'];
    money = json['money'];
    monthCharged = json['monthCharged'];
    monthDischarged = json['monthDischarged'];
    monthEnergy = json['monthEnergy'];
    oilReduced = json['oilReduced'];
    outputPower = json['outputPower'];
    refreshTimestap = json['refreshTimestap'] != null
        ? RefreshTimestap.fromJson(json['refreshTimestap'])
        : null;
    todayCharged = json['todayCharged'];
    todayDischarged = json['todayDischarged'];
    todayEnergy = json['todayEnergy'];
    totalCharged = json['totalCharged'];
    totalDischarged = json['totalDischarged'];
    totalEnergy = json['totalEnergy'];
    yearCharged = json['yearCharged'];
    yearDischarged = json['yearDischarged'];
    yearEnergy = json['yearEnergy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CO2Reduced'] = cO2Reduced;
    data['batteryPower'] = batteryPower;
    data['batteryStatus'] = batteryStatus;
    data['coalReduced'] = coalReduced;
    data['gridPower'] = gridPower;
    data['loadPower'] = loadPower;
    data['money'] = money;
    data['monthCharged'] = monthCharged;
    data['monthDischarged'] = monthDischarged;
    data['monthEnergy'] = monthEnergy;
    data['oilReduced'] = oilReduced;
    data['outputPower'] = outputPower;
    if (refreshTimestap != null) {
      data['refreshTimestap'] = refreshTimestap!.toJson();
    }
    data['todayCharged'] = todayCharged;
    data['todayDischarged'] = todayDischarged;
    data['todayEnergy'] = todayEnergy;
    data['totalCharged'] = totalCharged;
    data['totalDischarged'] = totalDischarged;
    data['totalEnergy'] = totalEnergy;
    data['yearCharged'] = yearCharged;
    data['yearDischarged'] = yearDischarged;
    data['yearEnergy'] = yearEnergy;
    return data;
  }
}

class RefreshTimestap {
  int? date;
  int? day;
  int? hours;
  int? minutes;
  int? month;
  int? seconds;
  int? time;
  int? timezoneOffset;
  int? year;

  RefreshTimestap(
      {this.date,
      this.day,
      this.hours,
      this.minutes,
      this.month,
      this.seconds,
      this.time,
      this.timezoneOffset,
      this.year});

  RefreshTimestap.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    hours = json['hours'];
    minutes = json['minutes'];
    month = json['month'];
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
    data['seconds'] = seconds;
    data['time'] = time;
    data['timezoneOffset'] = timezoneOffset;
    data['year'] = year;
    return data;
  }
}
