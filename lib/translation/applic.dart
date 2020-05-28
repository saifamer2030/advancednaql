import 'dart:ui';

typedef void LocaleChangeCallback(Locale locale);

class APPLIC {

  final List<String> supportedLanguages = [
    "English",
    "Arabic",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "ar",
  ];

  // Returns the list of supported Locales
  //Iterable<Locale> supportedLocales() => supportedLanguages.map<Locale>((lang) => new Locale(lang,''));
  Iterable<Locale> supportedLocales() => supportedLanguagesCodes
      .map<Locale>((lang) => new Locale(lang, ''));

  // Function to be invoked when changing the working language
  LocaleChangeCallback onLocaleChanged;

  ///
  /// Internals
  ///
  static final APPLIC _applic = new APPLIC._internal();

  factory APPLIC() {
    return _applic;
  }

  APPLIC._internal();
}

APPLIC applic = new APPLIC();
