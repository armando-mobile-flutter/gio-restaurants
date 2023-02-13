import 'package:gio_restaurants/app/main/interfaces/index.dart';
import 'package:gio_restaurants/app/main/models/favorite_model.dart';
import 'package:gio_restaurants/app/main/data/favorites.dart';

class FavoriteRepository implements IFavoriteRepository {
  final List<FavoriteModel>? _favorites;

  FavoriteRepository() : _favorites = FavoritesController().getFavorites();

  @override
  List<FavoriteModel>? get favorites => _favorites;

  @override
  Future<List<FavoriteModel>?> getAll() =>
      Future.delayed(const Duration(seconds: 3), () => _favorites);

  @override
  Future<FavoriteModel?> get(int id) => Future.delayed(
      const Duration(seconds: 3),
      () => _favorites?.firstWhere((element) => element.id == id));

  @override
  Future<FavoriteModel> save(FavoriteModel model) =>
      Future.delayed(const Duration(seconds: 3), () {
        if (model.id > 0) {
          var index =
              _favorites?.indexWhere((element) => element.id == model.id);
          _favorites?[index!] = model;
        } else {
          var count = _favorites?.length;
          model.id = count != null ? count + 1 : 1;

          _favorites?.add(model);
        }
        return model;
      });

  @override
  Future<void> delete(int id) => Future.delayed(const Duration(seconds: 3), () {
        _favorites?.removeWhere((element) => element.id == id);
      });
}
