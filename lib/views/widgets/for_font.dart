import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sum_swap_uz/utils/extensions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Showmoddombottomforfont extends StatefulWidget {
  const Showmoddombottomforfont({super.key});

  @override
  State<Showmoddombottomforfont> createState() =>
      _ShowmoddombottomforfontState();
}

class _ShowmoddombottomforfontState extends State<Showmoddombottomforfont> {
  SharedPreferences? sharedPreferences;
  List<String> fontFamilies = [
    GoogleFonts.montserrat().fontFamily!,
    GoogleFonts.openSans().fontFamily!,
    GoogleFonts.roboto().fontFamily!,
    GoogleFonts.notoSans().fontFamily!,
    GoogleFonts.lato().fontFamily!,
    GoogleFonts.rubik().fontFamily!,
    GoogleFonts.playfairDisplay().fontFamily!,
    GoogleFonts.alegreyaSans().fontFamily!,
  ];

  @override
  void initState() {
    super.initState();
    initializeSharedPreference();
  }

  void initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  void changeFontFamily(String fontFamily) {
    final cleanFontFamily = fontFamily.split('_')[0].splitTextByCapitalLetter();
    AdaptiveTheme.of(context).setTheme(
      light: AdaptiveTheme.of(context).lightTheme.copyWith(
            textTheme: Typography().white.apply(
                  fontFamily: fontFamily,
                ),
          ),
      dark: AdaptiveTheme.of(context).darkTheme.copyWith(
            textTheme: Typography().white.apply(
                  fontFamily: fontFamily,
                ),
          ),
    );
    sharedPreferences?.setString("font", cleanFontFamily);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: fontFamilies.map((fontFamily) {
            return ZoomTapAnimation(
              onTap: () {
                changeFontFamily(fontFamily);
              },
              child: ListTile(
                title: Text(
                  fontFamily.substring(0, fontFamily.indexOf("_")),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 25,
                  ),
                ),
                trailing: sharedPreferences?.getString("font") ==
                        fontFamily.split('_')[0].splitTextByCapitalLetter()
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
