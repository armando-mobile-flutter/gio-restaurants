import 'package:gio_restaurants/app/main/models/index.dart';

abstract class IPreferencesRepository {
  /// Function that get Theme implemented
  Future<Theme?> getThemeAsync();

  /// Function that set Theme Selected
  Future<void> setThemeAsync(Theme theme);
}
