import 'package:daily_presentation/src/daily_screen/weight_details_bloc/weight_details_bloc.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_domain/weight_domain.dart';

class WeightDetailsCard extends StatelessWidget {
  final Weight _weight;

  const WeightDetailsCard(this._weight, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeightDetailsBloc(MyDI.getWeightDetails())
          ..add(LoadWeightDetailsEvent(_weight)),
    child: BlocBuilder<WeightDetailsBloc, WeightDetailsState>(
      builder: (context, state) {

        if (state is! WeightDetailsSuccess) {
          return Container();
        }

        return weightDetailsCard(state.weightDetails);
      },
    ),);
  }

  Widget weightDetailsCard(WeightDetails weightDetails) =>
      Expanded(child: Center(child: Text(weightDetails.toString())));
}
