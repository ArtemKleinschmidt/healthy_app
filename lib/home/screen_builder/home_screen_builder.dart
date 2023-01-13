import 'package:daily_ui/daily_ui.dart';
import 'package:flutter/material.dart';

import '../../features/charts/presentation/charts_screen.dart';
import '../../features/info/presentation/info_screen.dart';
import '../../features/more/presentation/more_screen.dart';
import 'home_body_builder.dart';
import 'home_screen_navigation_builder.dart';

const titles = <String>["Daily", "Charts", "Info", "More"];
const icons = <IconData>[
  Icons.calendar_today,
  Icons.bar_chart,
  Icons.info_outline,
  Icons.person,
];

final homeWidgets = [
  const DailyScreen(),
  const ChartsScreen(),
  const InfoScreen(),
  const MoreScreen(),
];

class HomeScreenBuilder {
  late HomeBodyBuilder homeBodyBuilder;
  late HomeNavigationBuilder homeNavigationBuilder;

  set isBigScreen(bool isBigScreen) {
    if (isBigScreen) {
      homeBodyBuilder = BigScreenHomeBodyBuilder();
      homeNavigationBuilder = BigScreenHomeNavigationBuilder();
    } else {
      homeBodyBuilder = StandartHomeBodyBuilder();
      homeNavigationBuilder = StandartHomeNavigationBuilder();
    }
  }

  Widget buildBody(BuildContext context, int index,
      ValueChanged<int> onDestinationSelected) {
    return homeBodyBuilder.build(context, index, onDestinationSelected);
  }

  Widget? buildNavigationBar(BuildContext context, int index,
      ValueChanged<int> onDestinationSelected) {
    return homeNavigationBuilder.build(context, index, onDestinationSelected);
  }
}
