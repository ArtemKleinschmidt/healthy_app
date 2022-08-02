import 'package:flutter/material.dart';

import 'home_screen_builder.dart';

abstract class HomeBodyBuilder {
  Widget build(
      BuildContext context, int index, ValueChanged<int> onDestinationSelected);
}

class StandartHomeBodyBuilder extends HomeBodyBuilder {
  @override
  Widget build(BuildContext context, int index,
      ValueChanged<int> onDestinationSelected) {
    return homeWidgets[index];
  }
}

class BigScreenHomeBodyBuilder extends HomeBodyBuilder {
  @override
  Widget build(BuildContext context, int index,
      ValueChanged<int> onDestinationSelected) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: index,
          destinations: [
            NavigationRailDestination(
              icon: Icon(icons[0]),
              label: Text(titles[0]),
            ),
            NavigationRailDestination(
              icon: Icon(icons[1]),
              label: Text(titles[1]),
            ),
            NavigationRailDestination(
              icon: Icon(icons[2]),
              label: Text(titles[2]),
            ),
            NavigationRailDestination(
              icon: Icon(icons[3]),
              label: Text(titles[3]),
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: homeWidgets[index]),
      ],
    );
  }
}
