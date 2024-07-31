import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:sum_swap_uz/views/widgets/for_color.dart';
import 'package:sum_swap_uz/views/widgets/for_lang.dart';
import 'package:sum_swap_uz/views/widgets/for_mode.dart';
import 'package:sum_swap_uz/views/widgets/for_font.dart';
import 'package:sum_swap_uz/views/widgets/for_question.dart';
import 'package:sum_swap_uz/views/widgets/for_about.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _getCurrentTheme();
  }

  Future<void> _getCurrentTheme() async {
    final themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {
      isDarkMode = themeMode == AdaptiveThemeMode.dark;
    });
  }

  void _showModalBottomSheetForMode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomformode();
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomforlang();
      },
    );
  }

  void showForColor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottomforcolor();
      },
    );
  }

  void _showFontBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Showmoddombottomforfont();
      },
    );
  }

  void showAbout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Forabout();
      },
    );
  }

  void showTelegram(BuildContext context) {
    const telegramUrl = 'https://t.me/sumswap_bot';
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Forquestion(telegramUrl: telegramUrl);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('settingspg'),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ZoomTapAnimation(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.language,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('lng'),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  _showFontBottomSheet(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.text_fields_sharp,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('chfont'),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  _showModalBottomSheetForMode(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.dark_mode_outlined,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('chmode'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  showForColor(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.color_lens_outlined,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('edit'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  showAbout(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.app_registration_sharp,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('aapp'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  showTelegram(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    CupertinoIcons.question_circle,
                    size: 40,
                  ),
                  title: Text(
                    context.tr('que'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
