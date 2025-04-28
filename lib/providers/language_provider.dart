import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tezgel_app/generated/l10n.dart'; // Generated localization file

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale;

  LanguageProvider() : _currentLocale = _getDefaultLocale() {
    _loadSavedLocale();
  }

  Locale get currentLocale => _currentLocale;

  static Locale _getDefaultLocale() {
    // Cihaz diline göre Locale belirle (ülke koduyla birlikte)
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (deviceLocale.languageCode == 'tr') {
      return const Locale('tr', 'TR');
    } else {
      return const Locale('en', 'US');
    }
  }

  Future<void> _loadSavedLocale() async {
    // Buraya SharedPreferences ekleyebilirsin ileride (şu an boş bırakıyoruz)
  }

  Future<void> changeLanguage(Locale newLocale) async {
    if (!S.delegate.isSupported(newLocale)) return;

    _currentLocale = newLocale;
    notifyListeners();
  }

  String getCurrentLanguageName() {
    switch (_currentLocale.languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      default:
        return 'English';
    }
  }
}
