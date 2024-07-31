import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Bottomforcolor extends StatefulWidget {
  const Bottomforcolor({super.key});

  @override
  State<Bottomforcolor> createState() => _BottomforcolorState();
}

class _BottomforcolorState extends State<Bottomforcolor> {
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    initializeSharedPreference();
    super.initState();
  }

  Future<void> initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  void changeColorOfApp(int index) {
    final selectedColor = colors[index];
    AdaptiveTheme.of(context).setTheme(
      light: AdaptiveTheme.of(context).lightTheme.copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: selectedColor,
              brightness: Brightness.light,
            ),
          ),
      dark: AdaptiveTheme.of(context).darkTheme.copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: selectedColor,
              brightness: Brightness.dark,
            ),
          ),
    );
    sharedPreferences?.setInt("color", selectedColor.value);
    Navigator.pop(context);
  }

  List<Color> colors = [
    Colors.blue,
    Colors.amber,
    Colors.red,
    Colors.deepPurple,
    Colors.cyan,
    Colors.green,
    Colors.lime,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr('changecolor'),
            style: TextStyle(
              fontSize: 23,
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(colors.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ZoomTapAnimation(
                      onTap: () => changeColorOfApp(index),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors[index],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
