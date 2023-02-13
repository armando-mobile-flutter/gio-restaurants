import 'package:flutter/cupertino.dart';
import 'package:gio_restaurants/app/main/favorites/screens/index.dart';
import 'package:gio_restaurants/app/main/providers/index.dart';
import 'package:gio_restaurants/app/main/settings/screen/setting_screen.dart';
import 'package:gio_restaurants/app/main/utils/build_theme.dart';
import 'package:provider/provider.dart';

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
            Widget? render;

            switch (index) {
              case 0:
                render = const FavoriteNavigationBar();
                break;
              case 1:
                render = const Counter();
                break;
              case 2:
                render = const SettingNavigationBar();
                break;
              default:
                render = Center(child: Text('Content of tab $index'));
                break;
            }

            return render;
          })));
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return CupertinoPageScaffold(
        child: CustomScrollView(slivers: <Widget>[
      const CupertinoSliverNavigationBar(
          leading: Icon(CupertinoIcons.star_circle),
          largeTitle: Text(
            'Counter',
            textAlign: TextAlign.center,
          ),
          trailing: Icon(CupertinoIcons.star_circle)),
      SliverFillRemaining(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Text('${counterProvider.count}',
                        style: const TextStyle(fontSize: 100))),
                const SizedBox(
                  height: 160.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CupertinoButton(
                          child: const Icon(CupertinoIcons.add, size: 50.0),
                          onPressed: () =>
                              context.read<CounterProvider>().increment()),
                      CupertinoButton(
                          child: const Icon(CupertinoIcons.minus, size: 50.0),
                          onPressed: () =>
                              context.read<CounterProvider>().decrement()),
                      CupertinoButton(
                          child: const Icon(CupertinoIcons.restart, size: 50.0),
                          onPressed: () =>
                              context.read<CounterProvider>().reset())
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]));
  }
}
