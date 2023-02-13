import 'package:flutter/foundation.dart';
import 'package:gio_restaurants/app/main/interfaces/index.dart';
import 'package:gio_restaurants/app/main/models/index.dart';

class FavoriteProvider with ChangeNotifier {
  final IFavoriteRepository _favoriteRepository;

  FavoriteProvider({required IFavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  List<FavoriteModel>? get favorites => _favoriteRepository.favorites;

  Future<List<FavoriteModel>?> getAll() async {
    var result = await _favoriteRepository.getAll();

    notifyListeners();

    return result;
  }

  Future<FavoriteModel?> get(int id) async {
    var result = await _favoriteRepository.get(id);

    notifyListeners();

    return result;
  }

  Future<FavoriteModel> save(FavoriteModel model) async {
    var result = await _favoriteRepository.save(model);

    notifyListeners();

    return result;
  }

  Future<void> delete(int id) async {
    await _favoriteRepository.delete(id);

    notifyListeners();
  }
}
