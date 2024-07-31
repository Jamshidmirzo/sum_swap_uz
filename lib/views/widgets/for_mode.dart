import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Bottomformode extends StatefulWidget {
  const Bottomformode({super.key});

  @override
  State<Bottomformode> createState() => _BottomformodeState();
}

class _BottomformodeState extends State<Bottomformode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setSystem();
            },
            child: ListTile(
              trailing:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
              leading: const Icon(CupertinoIcons.device_phone_portrait),
              title: Text(
                context.tr('lt'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setLight();
            },
            child: ListTile(
              trailing:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
              leading: const Icon(Icons.light_mode),
              title: Text(
                context.tr('lm'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setDark();
            },
            child: ListTile(
              trailing: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              leading: const Icon(Icons.dark_mode),
              title: Text(
                context.tr('dm'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
