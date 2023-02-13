import 'package:gio_restaurants/app/main/interfaces/ipreferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gio_restaurants/app/main/models/index.dart';

class PreferencesRepository implements IPreferencesRepository {
  static const String _themeKey = 'theme';
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  @override
  Future<Theme?> getThemeAsync() async {
    final pref = await _pref;
    final index = pref.getInt(_themeKey);

    return index != null ? Theme.values[index] : null;
  }

  @override
  Future<void> setThemeAsync(Theme theme) async {
    final pref = await _pref;

    await pref.setInt(_themeKey, theme.index);
  }
}
