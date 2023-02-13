import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/providers/preference_provider.dart';
import 'package:gio_restaurants/app/main/repositories/preferences_repository.dart';
import 'package:provider/provider.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderRegistration extends StatelessWidget {
  const MultiProviderRegistration({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ...ProviderRegistration.providers,
          ...FutureProviderRegistration.futureProviders,
          ...ChangeNotifierProviderRegistration.changeNotifierProviders
        ],
        child: child,
      );
}

class ProviderRegistration {
  static List<SingleChildWidget> providers = <SingleChildWidget>[];
}

class FutureProviderRegistration {
  static List<SingleChildWidget> futureProviders = <SingleChildWidget>[];
}

class ChangeNotifierProviderRegistration {
  static List<SingleChildWidget> changeNotifierProviders = <SingleChildWidget>[
    ChangeNotifierProvider(
        create: (_) =>
            PreferenceProvider(preferencesRepository: PreferencesRepository()))
  ];
}
