import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/i18n.dart';

class AppLocalizations {

  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
  String get languageCode => locale.languageCode;
  String get appName => I18n.localizations[locale.languageCode]!["appName"]!;
  String get logNote => I18n.localizations[locale.languageCode]!["logNote"]!;
  String get passwdNote => I18n.localizations[locale.languageCode]!["passwdNote"]!;
  String get login => I18n.localizations[locale.languageCode]!["login"]!;
  String get loginNote1 => I18n.localizations[locale.languageCode]!["loginNote1"]!;
  String get loginNote2 => I18n.localizations[locale.languageCode]!["loginNote2"]!;
  String get loginErr27 => I18n.localizations[locale.languageCode]!["loginErr27"]!;
  String get loginErr8 => I18n.localizations[locale.languageCode]!["loginErr8"]!;
  String get loginErr2 => I18n.localizations[locale.languageCode]!["loginErr2"]!;
  String get loginErrSys => I18n.localizations[locale.languageCode]!["loginErrSys"]!;
  String get forwardok => I18n.localizations[locale.languageCode]!["forwardok"]!;
  String get note => I18n.localizations[locale.languageCode]!["note"]!;
  String get version => I18n.localizations[locale.languageCode]!["version"]!;
  String get curServer => I18n.localizations[locale.languageCode]!["curServer"]!;
  String get home1 => I18n.localizations[locale.languageCode]!["home1"]!;
  String get home2 => I18n.localizations[locale.languageCode]!["home2"]!;
  String get home3 => I18n.localizations[locale.languageCode]!["home3"]!;
  String get home4 => I18n.localizations[locale.languageCode]!["home4"]!;
  String get home5 => I18n.localizations[locale.languageCode]!["home5"]!;
  String get home6 => I18n.localizations[locale.languageCode]!["home6"]!;
  String get home7 => I18n.localizations[locale.languageCode]!["home7"]!;
  String get home8 => I18n.localizations[locale.languageCode]!["home8"]!;
  String get storageBoard => I18n.localizations[locale.languageCode]!["storage_board"]!;
  String get chargedDay => I18n.localizations[locale.languageCode]!["charged_day"]!;
  String get chargedTotal => I18n.localizations[locale.languageCode]!["charged_total"]!;
  String get dischargedDay => I18n.localizations[locale.languageCode]!["discharged_day"]!;
  String get dischargedTotal => I18n.localizations[locale.languageCode]!["discharged_total"]!;
  String get batteryCapaciry => I18n.localizations[locale.languageCode]!["battery_capaciry"]!;
  String get batterySoc => I18n.localizations[locale.languageCode]!["battery_soc"]!;
  String get pvPower => I18n.localizations[locale.languageCode]!["pv_power"]!;
  String get batteryPower => I18n.localizations[locale.languageCode]!["battery_power"]!;
  String get loadPower => I18n.localizations[locale.languageCode]!["load_power"]!;
  String get gridPower => I18n.localizations[locale.languageCode]!["grid_power"]!;
  String get plants1 => I18n.localizations[locale.languageCode]!["plants1"]!;
  String get plants2 => I18n.localizations[locale.languageCode]!["plants2"]!;
  String get plants3 => I18n.localizations[locale.languageCode]!["plants3"]!;
  String get plants4 => I18n.localizations[locale.languageCode]!["plants4"]!;
  String get plants5 => I18n.localizations[locale.languageCode]!["plants5"]!;
  String get plants6 => I18n.localizations[locale.languageCode]!["plants6"]!;
  String get plants7 => I18n.localizations[locale.languageCode]!["plants7"]!;
  String get plants8 => I18n.localizations[locale.languageCode]!["plants8"]!;
  String get plants9 => I18n.localizations[locale.languageCode]!["plants9"]!;
  String get plants10 => I18n.localizations[locale.languageCode]!["plants10"]!;
  String get plants11 => I18n.localizations[locale.languageCode]!["plants11"]!;
  String get plants12 => I18n.localizations[locale.languageCode]!["plants12"]!;
  String get plants13 => I18n.localizations[locale.languageCode]!["plants13"]!;
  String get plants14 => I18n.localizations[locale.languageCode]!["plants14"]!;
  String get plants15 => I18n.localizations[locale.languageCode]!["plants15"]!;
  String get plants16 => I18n.localizations[locale.languageCode]!["plants16"]!;

  String get warn1 => I18n.localizations[locale.languageCode]!["warn1"]!;
  String get warn2 => I18n.localizations[locale.languageCode]!["warn2"]!;
  String get warn3 => I18n.localizations[locale.languageCode]!["warn3"]!;
  String get warn4 => I18n.localizations[locale.languageCode]!["warn4"]!;
  String get warn5 => I18n.localizations[locale.languageCode]!["warn5"]!;
  String get warn6 => I18n.localizations[locale.languageCode]!["warn6"]!;
  String get warn7 => I18n.localizations[locale.languageCode]!["warn7"]!;
  String get warn8 => I18n.localizations[locale.languageCode]!["warn8"]!;
  String get warn9 => I18n.localizations[locale.languageCode]!["warn9"]!;
  String get noData => I18n.localizations[locale.languageCode]!["noData"]!;
  String get all => I18n.localizations[locale.languageCode]!["all"]!;
  String get allStatus => I18n.localizations[locale.languageCode]!["allStatus"]!;
  String get handled => I18n.localizations[locale.languageCode]!["handled"]!;
  String get unhandled => I18n.localizations[locale.languageCode]!["unhandled"]!;
  String get allDevice => I18n.localizations[locale.languageCode]!["allDevice"]!;
  String get device1 => I18n.localizations[locale.languageCode]!["device1"]!;
  String get device2 => I18n.localizations[locale.languageCode]!["device2"]!;
  String get device3 => I18n.localizations[locale.languageCode]!["device3"]!;
  String get device4 => I18n.localizations[locale.languageCode]!["device4"]!;
  String get device5 => I18n.localizations[locale.languageCode]!["device5"]!;
  String get device6 => I18n.localizations[locale.languageCode]!["device6"]!;
  String get device7 => I18n.localizations[locale.languageCode]!["device7"]!;
  String get device8 => I18n.localizations[locale.languageCode]!["device8"]!;
  String get device9 => I18n.localizations[locale.languageCode]!["device9"]!;
  String get device10 => I18n.localizations[locale.languageCode]!["device10"]!;
  String get device11 => I18n.localizations[locale.languageCode]!["device11"]!;
  String get device12 => I18n.localizations[locale.languageCode]!["device12"]!;
  String get device13 => I18n.localizations[locale.languageCode]!["device13"]!;
  String get device14 => I18n.localizations[locale.languageCode]!["device14"]!;
  String get device15 => I18n.localizations[locale.languageCode]!["device15"]!;
  String get setting1 => I18n.localizations[locale.languageCode]!["setting1"]!;
  String get setting2 => I18n.localizations[locale.languageCode]!["setting2"]!;
  String get setting3 => I18n.localizations[locale.languageCode]!["setting3"]!;
  String get setting4 => I18n.localizations[locale.languageCode]!["setting4"]!;
  String get passwd1 => I18n.localizations[locale.languageCode]!["passwd1"]!;
  String get passwd2 => I18n.localizations[locale.languageCode]!["passwd2"]!;
  String get passwd3 => I18n.localizations[locale.languageCode]!["passwd3"]!;
  String get passwd4 => I18n.localizations[locale.languageCode]!["passwd4"]!;
  String get passwd5 => I18n.localizations[locale.languageCode]!["passwd5"]!;
  String get passwd6 => I18n.localizations[locale.languageCode]!["passwd6"]!;
  String get passwd7 => I18n.localizations[locale.languageCode]!["passwd7"]!;
  String get passwd8 => I18n.localizations[locale.languageCode]!["passwd8"]!;
  String get passwd9 => I18n.localizations[locale.languageCode]!["passwd9"]!;
  String get passwd10 => I18n.localizations[locale.languageCode]!["passwd10"]!;
  String get passwd11 => I18n.localizations[locale.languageCode]!["passwd11"]!;
  String get passwd12 => I18n.localizations[locale.languageCode]!["passwd12"]!;
  String get passwd13 => I18n.localizations[locale.languageCode]!["passwd13"]!;
  String get info1 => I18n.localizations[locale.languageCode]!["info1"]!;
  String get info2 => I18n.localizations[locale.languageCode]!["info2"]!;
  String get introduction1 => I18n.localizations[locale.languageCode]!["introduction1"]!;
  String get introduction2 => I18n.localizations[locale.languageCode]!["introduction2"]!;
  String get station1 => I18n.localizations[locale.languageCode]!["station1"]!;
  String get station2 => I18n.localizations[locale.languageCode]!["station2"]!;
  String get station3 => I18n.localizations[locale.languageCode]!["station3"]!;
  String get station4 => I18n.localizations[locale.languageCode]!["station4"]!;
  String get station5 => I18n.localizations[locale.languageCode]!["station5"]!;
  String get station6 => I18n.localizations[locale.languageCode]!["station6"]!;
  String get station7 => I18n.localizations[locale.languageCode]!["station7"]!;
  String get station8 => I18n.localizations[locale.languageCode]!["station8"]!;
  String get station9 => I18n.localizations[locale.languageCode]!["station9"]!;
  String get station10 => I18n.localizations[locale.languageCode]!["station10"]!;
  String get station11 => I18n.localizations[locale.languageCode]!["station11"]!;
  String get station12 => I18n.localizations[locale.languageCode]!["station12"]!;
  String get station13 => I18n.localizations[locale.languageCode]!["station13"]!;
  String get day => I18n.localizations[locale.languageCode]!["day"]!;
  String get month => I18n.localizations[locale.languageCode]!["month"]!;
  String get year => I18n.localizations[locale.languageCode]!["year"]!;
  String get total => I18n.localizations[locale.languageCode]!["total"]!;
  String get history => I18n.localizations[locale.languageCode]!["history"]!;
  String get realinfo => I18n.localizations[locale.languageCode]!["realinfo"]!;
  String get remotectrl => I18n.localizations[locale.languageCode]!["remotectrl"]!;
  String get upTime => I18n.localizations[locale.languageCode]!["upTime"]!;
  String get devCode => I18n.localizations[locale.languageCode]!["devCode"]!;
  String get devAddress => I18n.localizations[locale.languageCode]!["devAddress"]!;
  String get loggerNumber => I18n.localizations[locale.languageCode]!["loggerNumber"]!;
  String get sigName => I18n.localizations[locale.languageCode]!["sigName"]!;
  String get sigChannel => I18n.localizations[locale.languageCode]!["sigChannel"]!;
  String get value => I18n.localizations[locale.languageCode]!["value"]!;
  String get unit => I18n.localizations[locale.languageCode]!["unit"]!;
  String get fieldName => I18n.localizations[locale.languageCode]!["fieldName"]!;
  String get operation => I18n.localizations[locale.languageCode]!["operation"]!;
  String get desc => I18n.localizations[locale.languageCode]!["desc"]!;
  String get integer => I18n.localizations[locale.languageCode]!["integer"]!;
  String get integerordecimal => I18n.localizations[locale.languageCode]!["integerordecimal"]!;
  String get command => I18n.localizations[locale.languageCode]!["command"]!;
  String get excute => I18n.localizations[locale.languageCode]!["excute"]!;
  String get inputany => I18n.localizations[locale.languageCode]!["inputany"]!;
  String get noItems => I18n.localizations[locale.languageCode]!["noItems"]!;
  String get realPower => I18n.localizations[locale.languageCode]!["realPower"]!;
  String get volCombox => I18n.localizations[locale.languageCode]!["volCombox"]!;
  String get soc => I18n.localizations[locale.languageCode]!["SOC"]!;
  String get loadPowerTotal => I18n.localizations[locale.languageCode]!["loadPower"]!;
  String get temp3Str1 => I18n.localizations[locale.languageCode]!["temp3Str1"]!;
  String get temp3Str2 => I18n.localizations[locale.languageCode]!["temp3Str2"]!;
  String get temp3Str3 => I18n.localizations[locale.languageCode]!["temp3Str3"]!;
  String get temp1Str1 => I18n.localizations[locale.languageCode]!["temp1Str1"]!;
  String get temp1Str2 => I18n.localizations[locale.languageCode]!["temp1Str2"]!;
  String get temp1Str3 => I18n.localizations[locale.languageCode]!["temp1Str3"]!;
  String get temp1Str4 => I18n.localizations[locale.languageCode]!["temp1Str4"]!;
  String get temp1Str5 => I18n.localizations[locale.languageCode]!["temp1Str5"]!;
  String get temp1Str6 => I18n.localizations[locale.languageCode]!["temp1Str6"]!;
  String get temp1Str7 => I18n.localizations[locale.languageCode]!["temp1Str7"]!;
  String get temp1Str8 => I18n.localizations[locale.languageCode]!["temp1Str8"]!;
  String get temp1Str9 => I18n.localizations[locale.languageCode]!["temp1Str9"]!;
  String get temp1Str10 => I18n.localizations[locale.languageCode]!["temp1Str10"]!;
  String get temp1Str11 => I18n.localizations[locale.languageCode]!["temp1Str11"]!;
  String get temp1Str12 => I18n.localizations[locale.languageCode]!["temp1Str12"]!;
  String get temp1Str13 => I18n.localizations[locale.languageCode]!["temp1Str13"]!;
  String get temp1Str14 => I18n.localizations[locale.languageCode]!["temp1Str14"]!;
  String get temp1Str15 => I18n.localizations[locale.languageCode]!["temp1Str15"]!;
  String get temp1Str16 => I18n.localizations[locale.languageCode]!["temp1Str16"]!;
  String get mapTitle => I18n.localizations[locale.languageCode]!["mapTitle"]!;
  String get tab1 => I18n.localizations[locale.languageCode]!["tab1"]!;
  String get tab2 => I18n.localizations[locale.languageCode]!["tab2"]!;
  String get tab3 => I18n.localizations[locale.languageCode]!["tab3"]!;
  String get tab4 => I18n.localizations[locale.languageCode]!["tab4"]!;
  String get error1 => I18n.localizations[locale.languageCode]!["error1"]!;
  String get error2 => I18n.localizations[locale.languageCode]!["error2"]!;
  String get authorityNote => I18n.localizations[locale.languageCode]!["authorityNote"]!;
  String get authButton => I18n.localizations[locale.languageCode]!["authButton"]!;
  String get videoTab => I18n.localizations[locale.languageCode]!["videoTab"]!;
  String get noCamera => I18n.localizations[locale.languageCode]!["noCamera"]!;
  String get deviceLive => I18n.localizations[locale.languageCode]!["deviceLive"]!;
  String get devicePlayback => I18n.localizations[locale.languageCode]!["devicePlayback"]!;
  String get ai => I18n.localizations[locale.languageCode]!["ai"]!;
  String get video => I18n.localizations[locale.languageCode]!["video"]!;
  String get ptzcontrol => I18n.localizations[locale.languageCode]!["PTZcontrol"]!;
  String get voiceAnnounce => I18n.localizations[locale.languageCode]!["VoiceAnnounce"]!;
  String get mirrorflip => I18n.localizations[locale.languageCode]!["mirrorflip"]!;
  String get lensmasking => I18n.localizations[locale.languageCode]!["Lensmasking"]!;
  String get gotit => I18n.localizations[locale.languageCode]!["gotit"]!;
  String get printscreen => I18n.localizations[locale.languageCode]!["printscreen"]!;
  String get share => I18n.localizations[locale.languageCode]!["share"]!;
  String get playback => I18n.localizations[locale.languageCode]!["playback"]!;
  String get videomode1 => I18n.localizations[locale.languageCode]!["videomode1"]!;
  String get videomode2 => I18n.localizations[locale.languageCode]!["videomode2"]!;
  String get local => I18n.localizations[locale.languageCode]!["local"]!;
  String get cloudstorage => I18n.localizations[locale.languageCode]!["cloudstorage"]!;
  String get liveplay => I18n.localizations[locale.languageCode]!["liveplay"]!;
  String get retry => I18n.localizations[locale.languageCode]!["retry"]!;
  String get videoNote1 => I18n.localizations[locale.languageCode]!["videoNote1"]!;
  String get videoNote2 => I18n.localizations[locale.languageCode]!["videoNote2"]!;
  String get videoNote3 => I18n.localizations[locale.languageCode]!["videoNote3"]!;
  String get videoNote4 => I18n.localizations[locale.languageCode]!["videoNote4"]!;
  String get videoNote5 => I18n.localizations[locale.languageCode]!["videoNote5"]!;
  String get videoNote6 => I18n.localizations[locale.languageCode]!["videoNote6"]!;
  String get videoNote7 => I18n.localizations[locale.languageCode]!["videoNote7"]!;
  String get videoNote8 => I18n.localizations[locale.languageCode]!["videoNote8"]!;
  String get videoNote9 => I18n.localizations[locale.languageCode]!["videoNote9"]!;
  String get videoNote10 => I18n.localizations[locale.languageCode]!["videoNote10"]!;
  String get batteryStatus => I18n.localizations[locale.languageCode]!["battery_status"]!;
  String get chargedToday => I18n.localizations[locale.languageCode]!["charged_today"]!;
  String get dischargedToday => I18n.localizations[locale.languageCode]!["discharged_today"]!;
  String get pvyeildToday => I18n.localizations[locale.languageCode]!["pvyeild_today"]!;
  String get undefined => I18n.localizations[locale.languageCode]!["undefined"]!;
  String get chargeE => I18n.localizations[locale.languageCode]!["chargeE"]!;
  String get dischargeE => I18n.localizations[locale.languageCode]!["dischargeE"]!;
  String get unitkwh => I18n.localizations[locale.languageCode]!["unitkwh"]!;
  String get monthTitle => I18n.localizations[locale.languageCode]!["monthTitle"]!;
  String get scheduleTime => I18n.localizations[locale.languageCode]!["schedule_time"]!;
  String get charge => I18n.localizations[locale.languageCode]!["charge"]!;
  String get sleep => I18n.localizations[locale.languageCode]!["sleep"]!;
  String get supplyByESS => I18n.localizations[locale.languageCode]!["supply_byESS"]!;
  String get chargeSolarGrid => I18n.localizations[locale.languageCode]!["charge_solar_grid"]!;
  String get chargeSolar => I18n.localizations[locale.languageCode]!["charge_solar"]!;
  String get solar => I18n.localizations[locale.languageCode]!["solar"]!;
  String get number => I18n.localizations[locale.languageCode]!["number"]!;
  String get name => I18n.localizations[locale.languageCode]!["name"]!;
  String get timeInterval => I18n.localizations[locale.languageCode]!["time_interval"]!;
  String get action => I18n.localizations[locale.languageCode]!["action"]!;
  String get actionType => I18n.localizations[locale.languageCode]!["action_type"]!;
  String get executeOnce => I18n.localizations[locale.languageCode]!["executeOnce"]!;
  String get periodic => I18n.localizations[locale.languageCode]!["periodic"]!;
  String get period => I18n.localizations[locale.languageCode]!["period"]!;
  String get powerSche => I18n.localizations[locale.languageCode]!["power_sche"]!;
  String get energyPrice => I18n.localizations[locale.languageCode]!["energy_price"]!;
  String get rateAttrib => I18n.localizations[locale.languageCode]!["rateAttrib"]!;
  String get rate1 => I18n.localizations[locale.languageCode]!["rate1"]!;
  String get rate2 => I18n.localizations[locale.languageCode]!["rate2"]!;
  String get rate3 => I18n.localizations[locale.languageCode]!["rate3"]!;
  String get rate4 => I18n.localizations[locale.languageCode]!["rate4"]!;
  String get noScheduleParam => I18n.localizations[locale.languageCode]!["noScheduleParam"]!;
  String get timeout => I18n.localizations[locale.languageCode]!["timeout"]!;
  String get ctrlNote1 => I18n.localizations[locale.languageCode]!["ctrlNote1"]!;
  String get ctrlNote2 => I18n.localizations[locale.languageCode]!["ctrlNote2"]!;
  String get ctrlNote3 => I18n.localizations[locale.languageCode]!["ctrlNote3"]!;
  String get ctrlNote4 => I18n.localizations[locale.languageCode]!["ctrlNote4"]!;
  String get ctrlNote5 => I18n.localizations[locale.languageCode]!["ctrlNote5"]!;
  String get ctrlNote6 => I18n.localizations[locale.languageCode]!["ctrlNote6"]!;
  String get ctrlNote7 => I18n.localizations[locale.languageCode]!["ctrlNote7"]!;
  String get ctrlNote8 => I18n.localizations[locale.languageCode]!["ctrlNote8"]!;
  String get loggerType1 => I18n.localizations[locale.languageCode]!["LoggerType1"]!;
  String get loggerType2 => I18n.localizations[locale.languageCode]!["LoggerType2"]!;
  String get loggerType3 => I18n.localizations[locale.languageCode]!["LoggerType3"]!;
  String get loggerType4 => I18n.localizations[locale.languageCode]!["LoggerType4"]!;
  String get loggerType5 => I18n.localizations[locale.languageCode]!["LoggerType5"]!;
  String get cancel => I18n.localizations[locale.languageCode]!["cancel"]!;
  String get ok => I18n.localizations[locale.languageCode]!["ok"]!;
  String get pickTime => I18n.localizations[locale.languageCode]!["pickTime"]!;
  
}