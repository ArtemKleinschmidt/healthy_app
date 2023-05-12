import 'package:daily_ui/src/daily_screen/weight_details_bloc/weight_details_bloc.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/ui.dart';
import 'package:weight/weight_domain.dart';

class WeightDetailsCard extends StatefulWidget {
  final Weight _weight;

  const WeightDetailsCard(this._weight, {super.key});

  @override
  State<WeightDetailsCard> createState() => _WeightDetailsCardState();
}

class _WeightDetailsCardState extends State<WeightDetailsCard> {

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  @override
  void didUpdateWidget(WeightDetailsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return BlocProvider(
      create: (context) => WeightDetailsBloc(MyDI.getWeightDetails())
        ..add(LoadWeightDetailsEvent(widget._weight)),
      child: BlocBuilder<WeightDetailsBloc, WeightDetailsState>(
        builder: (context, state) {
          if (state is! WeightDetailsSuccess) {
            return weightDetailsCard(null, context);
          }

          return weightDetailsCard(state.weightDetails, context);
        },
      ),
    );
  }

  Widget weightDetailsCard(
          WeightDetails? weightDetails, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Body Mass Index",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textOrShimmer(weightDetails, weightDetails?.bodyMassIndex.toStringAsFixed(2), 40, context),
                    const SizedBox(
                      height: 52,
                    ),
                    Text(
                      "Body composition",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textOrShimmer(weightDetails, weightDetails?.bodyType.name.toUpperCase(), 120 ,context),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget textOrShimmer(WeightDetails? weightDetails, String? text, double width, BuildContext context) {
    final Widget textOrShimmer;
    if (weightDetails == null) {
      textOrShimmer = Shimmer(
                          gradient: LinearGradient(
                              colors: [Colors.lightGreen.shade300, Colors.white]),
                          child: Container(
                            height: 14,
                            width: width,
                            color: Colors.green,
                          ),
                        );
    } else {
      textOrShimmer = Text(
                          text ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
    }
    return Container(height: 24, alignment: Alignment.center, child: textOrShimmer,);
  }
}
