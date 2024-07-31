import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  String? code;

  Cards({super.key, required this.code});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Map<String, dynamic> flagsMap = {
    "AED": 'assets/images/aed.png',
    "AUD": 'assets/images/aud.png',
    "CAD": 'assets/images/cad.png',
    "CHF": 'assets/images/chf.png',
    "CNY": 'assets/images/cny.png',
    "DKK": 'assets/images/dkk.png',
    "EGP": 'assets/images/egp.png',
    "EUR": 'assets/images/eur.png',
    "GBP": 'assets/images/gbp.png',
    "ISK": 'assets/images/isk.png',
    "JPY": 'assets/images/jpy.png',
    "KRW": 'assets/images/krw.png',
    "KWD": 'assets/images/kwd.png',
    "KZT": 'assets/images/kzt.png',
    "LBP": 'assets/images/lbp.png',
    "MYR": 'assets/images/myr.png',
    "NOK": 'assets/images/nok.png',
    "PLN": 'assets/images/pln.png',
    "RUB": 'assets/images/rub.png',
    "SEK": 'assets/images/sek.png',
    "SGD": 'assets/images/sgd.png',
    "TRY": 'assets/images/try.png',
    "UAH": 'assets/images/uah.png',
    "USD": 'assets/images/usd.png',
  };

  @override
  Widget build(BuildContext context) {
    String flagImage = flagsMap[widget.code] ?? 'assets/images/nth.png';

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(flagImage),
        ),
      ),
    );
  }
}
