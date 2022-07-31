import 'package:flutter/material.dart';

import '../../../home/fab_click_listener.dart';

class DailyScreen extends StatelessWidget implements FabClickListener {
  const DailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Daily screen"),
      ),
    );
  }

  @override
  void onFabClicked() {
    debugPrint("Fab clicked");
  }

}
