import 'package:flutter/material.dart';
import 'package:weight_domain/weight_domain.dart';

class WeightDetailsCard extends StatelessWidget {
  final Weight _weight;

  const WeightDetailsCard(this._weight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: Text(_weight.toString())));
  }
}
