import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/features/daily/presentation/weight_bloc.dart';
import 'package:healthy_app/home/fab_click_listener.dart';
import '../common/di/di.dart';
import '../common/presentation/ui_tools.dart';
import 'screen_builder/home_screen_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeScreenBuilder = HomeScreenBuilder();
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    homeScreenBuilder.isBigScreen = isBigScreen(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeightBloc(MyDI.getWeight()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[_index]),
        ),
        body: _getBody(),
        bottomNavigationBar: _getNavigationBar(),
        floatingActionButton: _getFAB(),
      ),
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
          child: Icon(Icons.add), onPressed: _onFabPressed);
    } else {
      return Container();
    }
  }

  _onFabPressed() {
    final currentScreen = homeWidgets[_index];
    if (currentScreen is FabClickListener) {
      (currentScreen as FabClickListener).onFabClicked();
    }
  }
}
