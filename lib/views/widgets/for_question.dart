import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Forquestion extends StatelessWidget {
  final String telegramUrl;
  const Forquestion({super.key, required this.telegramUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            const SizedBox(
              width: 40,
            ),
            Text(
              context.tr('tg'),
              style: TextStyle(
                fontSize: 18,
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            Center(
              child: ZoomTapAnimation(
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(telegramUrl))) {
                    await launchUrl(Uri.parse(telegramUrl));
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch Telegram'),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade300,
                  ),
                  child: const Icon(
                    Icons.telegram,
                    size: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
