import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:sum_swap_uz/models/currency.dart';
import 'package:sum_swap_uz/view_model/currencyviewmodel.dart';
import 'package:sum_swap_uz/views/widgets/for_currency.dart';
import 'package:sum_swap_uz/views/widgets/cards.dart';
import 'package:sum_swap_uz/views/widgets/translatecurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final currencyViewModel = Currencyviewmodel();
  late String firstTitle;
  String code = '';
  final currencyController = TextEditingController();
  double result = 0;
  double buyPrice = 0;
  double sellPrice = 0;
  String currency = 'UZS';
  double lastOne = 0;
  int isKotta = 14;
  bool buy = false;
  bool sell = true;
  bool _isLoading = true;
  final transltor = Translatecurrency();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    try {
      Currency currency = await currencyViewModel.getDollar();
      setState(() {
        code = currency.code;
        firstTitle = currency.title;
        buyPrice = double.tryParse(currency.nbu_buy_price) ?? 0;
        sellPrice = double.tryParse(currency.nbu_cell_price) ?? 0;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void exchange() {
    if (formKey.currentState!.validate()) {
      double amount = double.parse(currencyController.text);

      setState(
        () {
          if (buy) {
            if (code == 'KZT' || code == 'RUB' || code == 'JPY') {
              if (currencyController.text.length >= 9) {
                result = lastOne;
                isKotta = 9;
              } else {
                result = buy ? buyPrice * amount : amount / sellPrice;
                lastOne = result;
              }
            } else {
              if (currencyController.text.length >= 6) {
                result = lastOne;
                isKotta = 6;
              } else {
                result = buy ? buyPrice * amount : amount / sellPrice;
                lastOne = result;
              }
            }
          } else {
            if (currencyController.text.length >= 14) {
              result = lastOne;
            } else {
              result = buy ? buyPrice * amount : amount / sellPrice;
              lastOne = result;
            }
          }
        },
      );
    }
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    final response = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomforcurrency();
      },
    );
    if (response != null) {
      setState(
        () {
          firstTitle = response['title'];
          code = response['code'];
          buyPrice = double.parse(response['buyprice']);
          sellPrice = double.parse(response['cellprice']);
          currencyController.clear();
          result = 0;
          isKotta = 14;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.tr('exchangepg'),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: _isLoading
            ? Center(
                child: Lottie.asset('assets/lotties/loading.json',
                    width: 100, height: 100),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: Column(
                        children: [
                          Flexible(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(0, -0.9),
                                  child: ZoomTapAnimation(
                                    onTap: () => _showModalBottomSheet(context),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Cards(code: code),
                                          ),
                                          const SizedBox(width: 30),
                                          Text(
                                            transltor.translator(
                                                code: code, context: context),
                                            style: TextStyle(
                                              color: AdaptiveTheme.of(context)
                                                          .mode ==
                                                      AdaptiveThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.9, 0.2),
                                  child: Form(
                                    key: formKey,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 25),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) => exchange(),
                                        controller: currencyController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return context.tr('error1');
                                          }
                                          if (double.tryParse(value) == null) {
                                            return context.tr('error2');
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          label: Text(
                                            tr('exchinput', args: [currency]),
                                            style: TextStyle(
                                              color: AdaptiveTheme.of(context)
                                                          .mode ==
                                                      AdaptiveThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              isKotta),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.9, -0.3),
                                  child: ZoomTapAnimation(
                                    onTap: () {
                                      setState(
                                        () {
                                          currency = code;
                                          buy = true;
                                          sell = false;
                                          currencyController.clear();
                                          result = 0;
                                          isKotta = 14;
                                        },
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      child: Text(
                                        context.tr('secondcurs'),
                                        style: TextStyle(
                                          color:
                                              AdaptiveTheme.of(context).mode ==
                                                      AdaptiveThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.9, -0.3),
                                  child: ZoomTapAnimation(
                                    onTap: () {
                                      setState(
                                        () {
                                          currency = 'UZS';
                                          buy = false;
                                          sell = true;
                                          currencyController.clear();
                                          result = 0;
                                          isKotta = 14;
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      alignment: Alignment.center,
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      child: Text(
                                        context.tr('thirdcurs'),
                                        style: TextStyle(
                                          color:
                                              AdaptiveTheme.of(context).mode ==
                                                      AdaptiveThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                result.toStringAsFixed(2),
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                buy ? "UZS" : code,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
