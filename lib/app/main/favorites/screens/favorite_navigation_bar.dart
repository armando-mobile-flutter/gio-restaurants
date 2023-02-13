import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/favorites/screens/index.dart';

class FavoriteNavigationBar extends StatelessWidget {
  const FavoriteNavigationBar({super.key});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
          child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.star_circle),
            largeTitle: Text(
              'Favorites',
              textAlign: TextAlign.center,
            ),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
              fillOverscroll: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[FavoriteList()],
              ))
        ],
      ));
}
