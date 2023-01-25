import 'package:flutter/cupertino.dart';

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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                'Drag me up',
                textAlign: TextAlign.center,
              )
            ],
          ))
        ],
      ));
}
