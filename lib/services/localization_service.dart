import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// in this class i load the json file and store the localized strings in a map , then i provide a method to get the localized string for a given key
// then i provide a delegate to load the localization service for the supported locales
// finally i provide a method to check if the locale is supported or not
class LocalizationService {
  late Map<String, dynamic> _localizedStrings;

  Future<void> load(Locale locale) async {
    String jsonString;
    try {
      jsonString = await rootBundle.loadString(
          'assets/lang/${locale.languageCode}-${locale.countryCode}.json');
    } catch (e) {
      jsonString = await rootBundle.loadString('assets/lang/en-US.json');
    }

    _localizedStrings = json.decode(jsonString);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<LocalizationService> delegate =
      _LocalizationServiceDelegate();
}

// delegate to load the localization service for the supported locales
// this delegate is used in the MaterialApp widget to load the localization service for the supported locales
class _LocalizationServiceDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService service = LocalizationService();
    await service.load(locale);
    return service;
  }

  @override
  bool shouldReload(_LocalizationServiceDelegate old) => false;
}
