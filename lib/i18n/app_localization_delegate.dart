import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/i18n/app_localizations.dart';
import 'package:flutter_optical_storage/i18n/i18n.dart';

class APPLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {

  const APPLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => I18n.languages().contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(APPLocalizationDelegate old) => false;

  // // 1.
  // static APPLocalizationDelegate delegate = APPLocalizationDelegate();

  // // 2.
  // @override
  // bool isSupported(Locale locale) {
  //   return ["en", "zh", "rus"].contains(locale.languageCode);
  // }

  // // 3
  // @override
  // Future<AppLocalizations> load(Locale locale) async {
  //   final appLocalizations = AppLocalizations(locale);
  //   await appLocalizations.loadJson();
  //   return appLocalizations;
  // }

  // // 4
  // @override
  // bool shouldReload(APPLocalizationDelegate old) {
  //   return false;
  // }

}