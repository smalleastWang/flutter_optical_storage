class WeatherModel {
  String? showapiResError;
  String? showapiResId;
  int? showapiResCode;
  int? showapiFeeNum;
  ShowapiResBody? showapiResBody;

  WeatherModel(
      {this.showapiResError,
      this.showapiResId,
      this.showapiResCode,
      this.showapiFeeNum,
      this.showapiResBody});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    showapiResError = json['showapi_res_error'];
    showapiResId = json['showapi_res_id'];
    showapiResCode = json['showapi_res_code'];
    showapiFeeNum = json['showapi_fee_num'];
    showapiResBody = json['showapi_res_body'] != null
        ? ShowapiResBody.fromJson(json['showapi_res_body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['showapi_res_error'] = showapiResError;
    data['showapi_res_id'] = showapiResId;
    data['showapi_res_code'] = showapiResCode;
    data['showapi_fee_num'] = showapiFeeNum;
    if (showapiResBody != null) {
      data['showapi_res_body'] = showapiResBody!.toJson();
    }
    return data;
  }
}

class ShowapiResBody {
  String? time;
  CityInfo? cityInfo;
  F2? f2;
  Now? now;
  String? remark;
  F2? f3;
  int? retCode;
  F2? f1;

  ShowapiResBody(
      {this.time,
      this.cityInfo,
      this.f2,
      this.now,
      this.remark,
      this.f3,
      this.retCode,
      this.f1});

  ShowapiResBody.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    cityInfo = json['cityInfo'] != null
        ? CityInfo.fromJson(json['cityInfo'])
        : null;
    f2 = json['f2'] != null ? F2.fromJson(json['f2']) : null;
    now = json['now'] != null ? Now.fromJson(json['now']) : null;
    remark = json['remark'];
    f3 = json['f3'] != null ? F2.fromJson(json['f3']) : null;
    retCode = json['ret_code'];
    f1 = json['f1'] != null ? F2.fromJson(json['f1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    if (cityInfo != null) {
      data['cityInfo'] = cityInfo!.toJson();
    }
    if (f2 != null) {
      data['f2'] = f2!.toJson();
    }
    if (now != null) {
      data['now'] = now!.toJson();
    }
    data['remark'] = remark;
    if (f3 != null) {
      data['f3'] = f3!.toJson();
    }
    data['ret_code'] = retCode;
    if (f1 != null) {
      data['f1'] = f1!.toJson();
    }
    return data;
  }
}

class CityInfo {
  String? c4;
  String? c17;
  double? longitude;
  String? c0;
  double? latitude;
  String? c7;
  String? c10;
  String? c15;
  String? c8;
  String? c2;
  String? c12;
  String? c5;
  String? c9;
  String? c6;
  String? c3;
  String? c11;
  String? c16;
  String? c1;

  CityInfo(
      {this.c4,
      this.c17,
      this.longitude,
      this.c0,
      this.latitude,
      this.c7,
      this.c10,
      this.c15,
      this.c8,
      this.c2,
      this.c12,
      this.c5,
      this.c9,
      this.c6,
      this.c3,
      this.c11,
      this.c16,
      this.c1});

  CityInfo.fromJson(Map<String, dynamic> json) {
    c4 = json['c4'];
    c17 = json['c17'];
    longitude = json['longitude'];
    c0 = json['c0'];
    latitude = json['latitude'];
    c7 = json['c7'];
    c10 = json['c10'];
    c15 = json['c15'];
    c8 = json['c8'];
    c2 = json['c2'];
    c12 = json['c12'];
    c5 = json['c5'];
    c9 = json['c9'];
    c6 = json['c6'];
    c3 = json['c3'];
    c11 = json['c11'];
    c16 = json['c16'];
    c1 = json['c1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c4'] = c4;
    data['c17'] = c17;
    data['longitude'] = longitude;
    data['c0'] = c0;
    data['latitude'] = latitude;
    data['c7'] = c7;
    data['c10'] = c10;
    data['c15'] = c15;
    data['c8'] = c8;
    data['c2'] = c2;
    data['c12'] = c12;
    data['c5'] = c5;
    data['c9'] = c9;
    data['c6'] = c6;
    data['c3'] = c3;
    data['c11'] = c11;
    data['c16'] = c16;
    data['c1'] = c1;
    return data;
  }
}

class F2 {
  String? dayWindPower;
  String? nightWindPower;
  String? nightWeatherCode;
  String? dayWeather;
  String? sunBeginEnd;
  String? airPress;
  String? dayWeatherCode;
  String? jiangshui;
  String? nightWeatherPic;
  String? nightWeather;
  String? day;
  String? dayWindDirection;
  String? nightWindDirection;
  int? weekday;
  String? ziwaixian;
  String? nightAirTemperature;
  String? dayWeatherPic;
  String? dayAirTemperature;

  F2(
      {this.dayWindPower,
      this.nightWindPower,
      this.nightWeatherCode,
      this.dayWeather,
      this.sunBeginEnd,
      this.airPress,
      this.dayWeatherCode,
      this.jiangshui,
      this.nightWeatherPic,
      this.nightWeather,
      this.day,
      this.dayWindDirection,
      this.nightWindDirection,
      this.weekday,
      this.ziwaixian,
      this.nightAirTemperature,
      this.dayWeatherPic,
      this.dayAirTemperature});

  F2.fromJson(Map<String, dynamic> json) {
    dayWindPower = json['day_wind_power'];
    nightWindPower = json['night_wind_power'];
    nightWeatherCode = json['night_weather_code'];
    dayWeather = json['day_weather'];
    sunBeginEnd = json['sun_begin_end'];
    airPress = json['air_press'];
    dayWeatherCode = json['day_weather_code'];
    jiangshui = json['jiangshui'];
    nightWeatherPic = json['night_weather_pic'];
    nightWeather = json['night_weather'];
    day = json['day'];
    dayWindDirection = json['day_wind_direction'];
    nightWindDirection = json['night_wind_direction'];
    weekday = json['weekday'];
    ziwaixian = json['ziwaixian'];
    nightAirTemperature = json['night_air_temperature'];
    dayWeatherPic = json['day_weather_pic'];
    dayAirTemperature = json['day_air_temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day_wind_power'] = dayWindPower;
    data['night_wind_power'] = nightWindPower;
    data['night_weather_code'] = nightWeatherCode;
    data['day_weather'] = dayWeather;
    data['sun_begin_end'] = sunBeginEnd;
    data['air_press'] = airPress;
    data['day_weather_code'] = dayWeatherCode;
    data['jiangshui'] = jiangshui;
    data['night_weather_pic'] = nightWeatherPic;
    data['night_weather'] = nightWeather;
    data['day'] = day;
    data['day_wind_direction'] = dayWindDirection;
    data['night_wind_direction'] = nightWindDirection;
    data['weekday'] = weekday;
    data['ziwaixian'] = ziwaixian;
    data['night_air_temperature'] = nightAirTemperature;
    data['day_weather_pic'] = dayWeatherPic;
    data['day_air_temperature'] = dayAirTemperature;
    return data;
  }
}

class Now {
  String? windDirection;
  String? aqi;
  String? weatherPic;
  String? windPower;
  String? temperatureTime;
  String? rain;
  String? weatherCode;
  String? temperature;
  String? sd;
  AqiDetail? aqiDetail;
  String? weather;

  Now(
      {this.windDirection,
      this.aqi,
      this.weatherPic,
      this.windPower,
      this.temperatureTime,
      this.rain,
      this.weatherCode,
      this.temperature,
      this.sd,
      this.aqiDetail,
      this.weather});

  Now.fromJson(Map<String, dynamic> json) {
    windDirection = json['wind_direction'];
    aqi = json['aqi'];
    weatherPic = json['weather_pic'];
    windPower = json['wind_power'];
    temperatureTime = json['temperature_time'];
    rain = json['rain'];
    weatherCode = json['weather_code'];
    temperature = json['temperature'];
    sd = json['sd'];
    aqiDetail = json['aqiDetail'] != null
        ? AqiDetail.fromJson(json['aqiDetail'])
        : null;
    weather = json['weather'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wind_direction'] = windDirection;
    data['aqi'] = aqi;
    data['weather_pic'] = weatherPic;
    data['wind_power'] = windPower;
    data['temperature_time'] = temperatureTime;
    data['rain'] = rain;
    data['weather_code'] = weatherCode;
    data['temperature'] = temperature;
    data['sd'] = sd;
    if (aqiDetail != null) {
      data['aqiDetail'] = aqiDetail!.toJson();
    }
    data['weather'] = weather;
    return data;
  }
}

class AqiDetail {
  String? primaryPollutant;
  String? aqi;
  String? pm10;
  String? area;
  String? co;
  String? o3;
  String? so2;
  String? no2;
  String? o38h;
  String? quality;
  String? num;
  String? pm25;

  AqiDetail(
      {this.primaryPollutant,
      this.aqi,
      this.pm10,
      this.area,
      this.co,
      this.o3,
      this.so2,
      this.no2,
      this.o38h,
      this.quality,
      this.num,
      this.pm25});

  AqiDetail.fromJson(Map<String, dynamic> json) {
    primaryPollutant = json['primary_pollutant'];
    aqi = json['aqi'];
    pm10 = json['pm10'];
    area = json['area'];
    co = json['co'];
    o3 = json['o3'];
    so2 = json['so2'];
    no2 = json['no2'];
    o38h = json['o3_8h'];
    quality = json['quality'];
    num = json['num'];
    pm25 = json['pm2_5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary_pollutant'] = primaryPollutant;
    data['aqi'] = aqi;
    data['pm10'] = pm10;
    data['area'] = area;
    data['co'] = co;
    data['o3'] = o3;
    data['so2'] = so2;
    data['no2'] = no2;
    data['o3_8h'] = o38h;
    data['quality'] = quality;
    data['num'] = num;
    data['pm2_5'] = pm25;
    return data;
  }
}
