import 'package:shared_ui_library/shared_ui_library.dart';
import 'package:flutter/material.dart';

import 'screen_builder/home_screen_builder.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final homeScreenBuilder = HomeScreenBuilder();
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    homeScreenBuilder.isBigScreen = isBigScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_index]),
      ),
      body: _getBody(),
      bottomNavigationBar: _getNavigationBar(),
      floatingActionButton: _getFAB(),
    );
  }

  Widget _getBody() {
    return homeScreenBuilder.buildBody(
        context,
        _index,
        (int index) => {
              setState(() => {_index = index})
            });
  }

  Widget? _getNavigationBar() {
    return homeScreenBuilder.buildNavigationBar(
        context,
        _index,
        (int index) => {
              setState(() => {_index = index})
            });
  }

  Widget _getFAB() {
    if (_index == 0) {
      return FloatingActionButton(
          onPressed: () => _onFabPressed(context),
          child: const Icon(Icons.add));
    } else {
      return Container();
    }
  }

  _onFabPressed(BuildContext context) {
    final currentScreen = homeWidgets[_index];
    if (currentScreen is FabClickListener) {
      (currentScreen as FabClickListener).onFabClicked(context);
    }
  }
}
