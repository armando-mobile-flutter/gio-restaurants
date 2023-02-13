import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/favorites/screens/index.dart';
import 'package:gio_restaurants/app/main/models/index.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:provider/provider.dart';

class FavoriteNavigationBar extends StatelessWidget {
  const FavoriteNavigationBar({super.key});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
          child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            leading: const Icon(CupertinoIcons.star_circle),
            largeTitle: const Text(
              'Favorites',
              textAlign: TextAlign.center,
            ),
            trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.add_circled,
                  size: 32.0,
                ),
                onPressed: () async => await context
                    .read<FavoriteProvider>()
                    .save(FavoriteModel(0, 'Test', 'Test Address', true))),
          ),
          SliverFillRemaining(
              fillOverscroll: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[FavoriteList()],
              ))
        ],
      ));
}
