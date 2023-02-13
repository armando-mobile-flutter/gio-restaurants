import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/models/index.dart';
import 'package:gio_restaurants/app/main/data/favorites.dart';

class FavoriteList extends StatelessWidget {
  FavoriteList({super.key});
  final favorites = FavoritesController().getFavorites();

  @override
  Widget build(BuildContext context) => CupertinoListSection.insetGrouped(
        children: <CupertinoListTile>[
          ...favorites
              .map((FavoriteModel favorite) => CupertinoListTile.notched(
                    title: Text(favorite.restaurantName),
                    subtitle: Text(favorite.address),
                    leading: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: favorite.status
                          ? CupertinoColors.activeGreen
                          : CupertinoColors.destructiveRed,
                    ),
                    additionalInfo: Text(favorite.status ? 'Open' : 'Close'),
                    backgroundColorActivated: CupertinoColors.activeBlue,
                  )),
        ],
      );
}
