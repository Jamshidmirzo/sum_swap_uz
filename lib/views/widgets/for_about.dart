import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Forabout extends StatelessWidget {
  const Forabout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'SumSwap',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 15,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr('about'),
              style: TextStyle(
                fontSize: 15,
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.tr('made', args: ['@operocder & @aytisoft']),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
