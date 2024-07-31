import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sum_swap_uz/views/screens/splash_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz"),
        Locale("en"),
        Locale("ru"),
      ],
      path: 'resources/langs',
      startLocale: const Locale("en"),
      child: const Converter(),
    ),
  );
}

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  Color? mainColorFuture;
  String? fontFamilyFuture;

  @override
  void initState() {
    super.initState();
  }

  Future<void> init() async {
    mainColorFuture = await initializeSharedPreference();
    fontFamilyFuture = await initializeSharedPreferenceForFont();
  }

  Future<Color> initializeSharedPreference() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    int? color = sharedPrefs.getInt('color');

    if (color == null) {
      color = Colors.blue.value;
      await sharedPrefs.setInt('color', color);
    }
    return Color(color);
  }

  Future<String> initializeSharedPreferenceForFont() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? fontFamily = sharedPrefs.getString('font');
    if (fontFamily == null) {
      fontFamily = 'Montserrat';
      await sharedPrefs.setString('font', fontFamily);
    }
    return fontFamily;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading color'));
        }

        final textTheme = GoogleFonts.getTextTheme(fontFamilyFuture!);

        return AdaptiveTheme(
          light: ThemeData(
            textTheme: textTheme,
            colorScheme: ColorScheme.fromSeed(seedColor: mainColorFuture!),
          ),
          dark: ThemeData.dark().copyWith(
            textTheme: textTheme,
            colorScheme: ColorScheme.fromSeed(
              seedColor: mainColorFuture!,
              brightness: Brightness.dark,
            ),
          ),
          initial: AdaptiveThemeMode.system,
          builder: (light, dark) {
            return MaterialApp(
              theme: light,
              darkTheme: dark,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: const Splashpage(),
            );
          },
        );
      },
    );
  }
}
