import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/models/index.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favorites;

    return CupertinoListSection.insetGrouped(
      children: <CupertinoListTile>[
        ...favorites!.map((FavoriteModel favorite) => CupertinoListTile.notched(
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
              onTap: () async =>
                  await context.read<FavoriteProvider>().delete(favorite.id),
            )),
      ],
    );
  }
}
