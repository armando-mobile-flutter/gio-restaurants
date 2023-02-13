import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/favorites/screens/index.dart';
import 'package:gio_restaurants/app/main/settings/screen/setting_screen.dart';
import 'package:gio_restaurants/app/main/utils/build_theme.dart';

class TabBar extends StatelessWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_circle,
                color: BuildTheme.getIOSIconColor(context)),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.map_pin_ellipse,
                  color: BuildTheme.getIOSIconColor(context)),
              label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings,
                  color: BuildTheme.getIOSIconColor(context)),
              label: 'Settngs'),
        ],
      ),
      tabBuilder: ((BuildContext context, int index) =>
          CupertinoTabView(builder: (BuildContext context) {
            if (index == 0) {
              return const FavoriteNavigationBar();
            } else if (index == 2) {
              return const SettingNavigationBar();
            } else {
              return Center(child: Text('Content of tab $index'));
            }
          })));
}
