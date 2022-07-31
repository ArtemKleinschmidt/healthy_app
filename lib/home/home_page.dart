import 'package:flutter/material.dart';
import 'package:healthy_app/home/fab_click_listener.dart';

import '../features/daily/presentation/daily_screen.dart';
import '../features/charts/presentation/charts_screen.dart';
import '../features/info/presentation/info_screen.dart';
import '../features/more/presentation/more_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  static const _titles = <String>["Daily", "Charts", "Info", "More"];
  static const _icons = <IconData>[
    Icons.calendar_today,
    Icons.bar_chart,
    Icons.info_outline,
    Icons.person,
  ];

  final _homeWidgets = [
    DailyScreen(),
    ChartsScreen(),
    InfoScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
      ),
      body: _getBody(),
      bottomNavigationBar: _getNavigationBar(),
      floatingActionButton: _getFAB(),
    );
  }

  Widget _getBody() {
    if (_isBigScreen()) {
      return Row(
        children: [
          NavigationRail(
            selectedIndex: _index,
            destinations: [
              NavigationRailDestination(
                icon: Icon(_icons[0]),
                label: Text(_titles[0]),
              ),
              NavigationRailDestination(
                icon: Icon(_icons[1]),
                label: Text(_titles[1]),
              ),
              NavigationRailDestination(
                icon: Icon(_icons[2]),
                label: Text(_titles[2]),
              ),
              NavigationRailDestination(
                icon: Icon(_icons[3]),
                label: Text(_titles[3]),
              ),
            ],
            onDestinationSelected: (int index) => {
              setState(() => {_index = index})
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _homeWidgets[_index]),
        ],
      );
    } else {
      return _homeWidgets[_index];
    }
  }

  Widget? _getNavigationBar() {
    if (_isBigScreen()) {
      return null;
    } else {
      return NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int index) => {
          setState(() => {_index = index})
        },
        destinations: [
          NavigationDestination(
            icon: Icon(_icons[0]),
            label: _titles[0],
          ),
          NavigationDestination(
            icon: Icon(_icons[1]),
            label: _titles[1],
          ),
          NavigationDestination(
            icon: Icon(_icons[2]),
            label: _titles[2],
          ),
          NavigationDestination(
            icon: Icon(_icons[3]),
            label: _titles[3],
          ),
        ],
      );
    }
  }

  Widget _getFAB() {
    if (_index == 0) {
      return FloatingActionButton(
          child: Icon(Icons.add), onPressed: _onFabPressed);
    } else {
      return Container();
    }
  }

  _onFabPressed() {
    final currentScreen = _homeWidgets[_index];
    if (currentScreen is FabClickListener) {
      (currentScreen as FabClickListener).onFabClicked();
    }
  }

  bool _isBigScreen() {
    return MediaQuery.of(context).size.width > 640.0;
  }
}
