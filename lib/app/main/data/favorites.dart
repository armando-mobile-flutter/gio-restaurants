import 'package:gio_restaurants/app/main/models/favoriteModel.dart';
import 'package:gio_restaurants/app/main/models/index.dart';

class FavoritesController {
  List<FavoriteModel> getFavorites() => <FavoriteModel>[
        FavoriteModel(1, 'Sonora Gill', 'Tlanepantla, Piramidez, 2023', false),
        FavoriteModel(2, 'Bobbinos', 'Cancun, Kabah, 2930', true),
        FavoriteModel(3, 'Los Gueros', 'Izcalli, Colinas del Lago, 3546', true),
        FavoriteModel(4, 'La Taberna', 'CDMX Reforma, 1002', false),
      ];
}
