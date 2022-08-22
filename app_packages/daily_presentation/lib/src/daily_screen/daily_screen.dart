import 'package:common_presentation/common_presentation.dart';
import 'package:daily_presentation/src/daily_screen/WeightDetailsCard.dart';
import 'package:daily_presentation/src/daily_screen/weight_card.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_domain/weight_domain.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'weight_bloc.dart';

class DailyScreen extends StatefulWidget implements FabClickListener {
  DailyScreen({Key? key}) : super(key: key);

  @override
  State<DailyScreen> createState() => _DailyScreenState();

  @override
  void onFabClicked() {
    debugPrint("Fab clicked");
  }
}

class _DailyScreenState extends State<DailyScreen> {
  var _selectedWeightIndex = -1;

  @override
  Widget build(BuildContext context) {
    return _dailyScreenContent(context);
  }

  Widget _dailyScreenContent(BuildContext context) {
    debugPrint("DailyScreen _dailyScreenContent");

    return BlocProvider(
      create: (context) => WeightBloc(MyDI.getWeight())..add(LoadWeightEvent()),
      child: BlocBuilder<WeightBloc, WeightState>(builder: (context, state) {
        debugPrint("DailyScreen state $state");

        if (state is WeightLoading) {
          return const Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is! WeightSuccess) return Container();

        List<Weight> weightList = state.weightList;

        Weight selectedWeight;
        if (_selectedWeightIndex == -1) {
          selectedWeight = state.weightList.first;
        } else {
          selectedWeight = weightList[_selectedWeightIndex];
        }

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  enableInfiniteScroll: false,
                  reverse: true,
                  onPageChanged:
                      (int index, CarouselPageChangedReason reason) =>
                          onPageChanged(index)),
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
            ),
            WeightDetailsCard(selectedWeight)
          ],
        );
      }),
    );
  }

  onPageChanged(int index) {
    setState(() {
      _selectedWeightIndex = index;
    });
  }
}
