import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:gio_restaurants/app/main/models/index.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:gio_restaurants/app/main/utils/build_theme.dart';

class SettingNavigationBar extends StatelessWidget {
  const SettingNavigationBar({super.key});

  void _showActionSheet(BuildContext context, PreferenceProvider provider) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Theme'),
        message: const Text('Choose a theme'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              provider.onUpdatePreferencesAsync(Theme.dart);
              Navigator.pop(context);
            },
            child: const Text('Dart'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              provider.onUpdatePreferencesAsync(Theme.light);
              Navigator.pop(context);
            },
            child: const Text('Light'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<PreferenceProvider>(context);

    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
            leading: const Icon(CupertinoIcons.star_circle),
            largeTitle: const Text(
              'Settings',
              textAlign: TextAlign.center,
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showActionSheet(context, preferences),
              child: Icon(
                CupertinoIcons.settings,
                size: 32,
                color: BuildTheme.getIOSIconColor(context),
              ),
            )),
        SliverFillRemaining(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
                    preferences.getTheme! == Theme.dart
                        ? 'Theme Dart'
                        : 'Theme Light',
                    textAlign: TextAlign.center))
          ],
        ))
      ],
    ));
  }
}
