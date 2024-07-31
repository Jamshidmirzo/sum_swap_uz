import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Translatecurrency {
  String translator({required String code, required BuildContext context}) {
    final Map<String, String> currencyTranslations = {
      "AED": context.tr('AED'),
      "AUD": context.tr('AUD'),
      "CAD": tr('CAD'),
      "CHF": tr('CHF'),
      "CNY": tr('CNY'),
      "DKK": tr('DKK'),
      "EGP": tr('EGP'),
      "EUR": tr('EUR'),
      "GBP": tr('GBP'),
      "ISK": tr('ISK'),
      "JPY": tr('JPY'),
      "KRW": tr('KRW'),
      "KWD": tr('KWD'),
      "KZT": tr('KZT'),
      "LBP": tr('LBP'),
      "MYR": tr('MYR'),
      "NOK": tr('NOK'),
      "PLN": tr('PLN'),
      "RUB": tr('RUB'),
      "SEK": tr('SEK'),
      "SGD": tr('SGD'),
      "TRY": tr('TRY'),
      "UAH": tr('UAH'),
      "USD": tr('USD')
    };
    return currencyTranslations[code] ?? tr('Unknown Currency');
  }
}
