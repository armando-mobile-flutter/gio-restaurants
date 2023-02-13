import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:gio_restaurants/app/main/extensions/registration_extentions.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:gio_restaurants/app/main/utils/build_theme.dart';
import 'package:gio_restaurants/app/main/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MultiProviderRegistration(child: HeadWidget());
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<PreferenceProvider>(context);

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: BuildTheme.getCupertinoTheme(preferences.getTheme!),
      home: const TabBar(),
    );
  }
}
