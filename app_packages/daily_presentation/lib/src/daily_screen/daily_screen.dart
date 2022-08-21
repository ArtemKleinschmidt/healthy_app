import 'package:common_presentation/common_presentation.dart';
import 'package:daily_presentation/src/daily_screen/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_domain/weight_domain.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'weight_bloc.dart';

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

      List<Weight> weightList = state.weightList;

      return CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          viewportFraction: 0.6,
          enableInfiniteScroll: false,
          reverse: true,
        ),
        items: weightList.map((weight) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: WeightCard(weight),
              );
            },
          );
        }).toList(),
      );

    });
  }
}
