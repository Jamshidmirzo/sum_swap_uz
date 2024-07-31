import 'package:sum_swap_uz/views/screens/exchange_page.dart';
import 'package:sum_swap_uz/views/screens/home_page.dart';
import 'package:sum_swap_uz/views/screens/setting_spage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bottomnavpage extends StatefulWidget {
  const Bottomnavpage({super.key});

  @override
  State<Bottomnavpage> createState() => _BottomnavpageState();
}

class _BottomnavpageState extends State<Bottomnavpage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Homepage(),
    const ExchangePage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.money_dollar_circle,
              size: 27,
            ),
            label: tr('courses'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.currency_exchange_outlined),
            label: tr('excahnge'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: tr('settings'),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
