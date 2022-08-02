import 'package:flutter/material.dart';

import 'home_screen_builder.dart';

abstract class HomeNavigationBuilder {
  Widget? build(BuildContext context, int index, ValueChanged<int> onDestinationSelected);
}

class StandartHomeNavigationBuilder extends HomeNavigationBuilder {

  @override
  Widget? build(BuildContext context, int index, ValueChanged<int> onDestinationSelected) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: Icon(icons[0]),
          label: titles[0],
        ),
        NavigationDestination(
          icon: Icon(icons[1]),
          label: titles[1],
        ),
        NavigationDestination(
          icon: Icon(icons[2]),
          label: titles[2],
        ),
        NavigationDestination(
          icon: Icon(icons[3]),
          label: titles[3],
        ),
      ],
    );
  }

}
class BigScreenHomeNavigationBuilder extends HomeNavigationBuilder {

  @override
  Widget? build(BuildContext context, int index, ValueChanged<int> onDestinationSelected) {
    return null;
  }

}