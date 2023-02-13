import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/interfaces/ipreferences_repository.dart';
import 'package:gio_restaurants/app/main/interfaces/index.dart';
import 'package:gio_restaurants/app/main/models/index.dart';

class PreferenceProvider with ChangeNotifier {
  final IPreferencesRepository _preferencesRepository;
  Theme? _currentTheme = Theme.dart;

  PreferenceProvider({required IPreferencesRepository preferencesRepository})
      : _preferencesRepository = preferencesRepository {
    onLoadPreferencesAsync();
  }

  Theme? get getTheme => _currentTheme;

  Future<void> onLoadPreferencesAsync() async {
    final theme = await _preferencesRepository.getThemeAsync();

    onUpdatePreferencesAsync(theme ?? _currentTheme!);
  }

  Future<void> onUpdatePreferencesAsync(Theme theme) async {
    await _preferencesRepository.setThemeAsync(theme);
    _currentTheme = theme;

    notifyListeners();
  }
}
