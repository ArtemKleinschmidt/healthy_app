import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/features/daily/presentation/weight_bloc.dart';

import '../../../home/fab_click_listener.dart';

class DailyScreen extends StatelessWidget implements FabClickListener {
  DailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _dailyScreenContent(context);
  }

  @override
  void onFabClicked() {
    debugPrint("Fab clicked");
  }

  Widget _dailyScreenContent(BuildContext context) {
    debugPrint("DailyScreen _dailyScreenContent");

    BlocProvider.of<WeightBloc>(context).add(LoadWeightEvent());

    return BlocBuilder<WeightBloc, WeightState>(builder: (context, state) {
      if (state is! WeightSuccess) return Container();

      WeightSuccess weightSuccess = state;
      // return widget here based on BlocA's state
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...weightSuccess.weightList.map((weight) => Card(
              elevation: 16,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      "Weight ${weight.weight} recorded at ${weight.date}"))))
        ],
      );
    });
  }
}
