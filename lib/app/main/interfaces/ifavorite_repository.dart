import 'package:gio_restaurants/app/main/models/index.dart';

abstract class IFavoriteRepository {
  List<FavoriteModel>? get favorites;
  Future<List<FavoriteModel>?> getAll();
  Future<FavoriteModel?> get(int id);
  Future<FavoriteModel> save(FavoriteModel model);
  Future<void> delete(int id);
}
