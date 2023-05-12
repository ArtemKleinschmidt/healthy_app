import 'package:shared_ui_library/shared_ui_library.dart';
import 'package:daily_ui/src/daily_screen/weight_details_card.dart';
import 'package:daily_ui/src/daily_screen/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/go_router.dart';
import 'package:shared_dependencies/get_it.dart';
import 'package:shared_dependencies/ui.dart';
import 'package:weight/weight_domain.dart';

import 'weight_bloc/weight_bloc.dart';

class DailyScreen extends StatefulWidget implements FabClickListener {
  const DailyScreen({Key? key}) : super(key: key);

  @override
  State<DailyScreen> createState() => _DailyScreenState();

  @override
  void onFabClicked(BuildContext context) {
    context.go('/add_weight');
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
      create: (context) => WeightBloc(GetIt.instance.get<GetWeightList>())
        ..add(LoadWeightEvent()),
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
            WeightDetailsCard(
              selectedWeight,
              key: ValueKey(selectedWeight.id),
            )
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
