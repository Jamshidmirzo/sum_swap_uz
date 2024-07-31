import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sum_swap_uz/models/currency.dart';
import 'package:sum_swap_uz/views/widgets/cards.dart';
import 'package:sum_swap_uz/views/widgets/translatecurrency.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class Currencyinfo extends StatefulWidget {
  final Currency currency;
  int index;
  int indextopage;

  Currencyinfo(
      {super.key,
      required this.currency,
      required this.index,
      required this.indextopage});

  @override
  State<Currencyinfo> createState() => _CurrencyinfoState();
}

class _CurrencyinfoState extends State<Currencyinfo> {
  bool isNotif = false;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        if (widget.indextopage == 0) {
          Navigator.pop(
            context,
            {
              'title': tr(widget.currency.code),
              'photo': widget.index,
              'buyprice': widget.currency.nbu_buy_price,
              'cellprice': widget.currency.nbu_cell_price,
              'code': widget.currency.code
            },
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Cards(
                    code: widget.currency.code,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Translatecurrency().translator(
                        code: widget.currency.code, context: context),
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        isNotif = !isNotif;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.notifications_active,
                        color: isNotif
                            ? Theme.of(context).colorScheme.errorContainer
                            : null,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        context.tr('maincurs'),
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Text(
                        widget.currency.cb_price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        context.tr('secondcurs'),
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Text(
                        widget.currency.nbu_cell_price.isEmpty
                            ? '-'
                            : widget.currency.nbu_cell_price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        context.tr('thirdcurs'),
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Text(
                        widget.currency.cb_price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
