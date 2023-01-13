import 'package:flutter/material.dart';
import 'package:weight/weight_domain.dart';

class WeightCard extends StatelessWidget {
  final Weight weight;

  const WeightCard(
    this.weight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    weight.formattedDate("yyyy MMM dd"),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 8,),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                          child: Text(
                            weight.weight.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                          ),
                        ))),
              ],
            )));
  }
}
