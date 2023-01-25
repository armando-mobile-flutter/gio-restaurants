import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/favorites/screens/index.dart';

class TabBar extends StatelessWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_circle),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.map_pin_ellipse), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settngs'),
        ],
      ),
      tabBuilder: ((BuildContext context, int index) => CupertinoTabView(
          builder: (BuildContext context) => (index == 0)
              ? const FavoriteNavigationBar()
              : Center(child: Text('Content of tab $index')))));
}
