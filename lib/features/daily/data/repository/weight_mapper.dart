import 'dart:convert';

import 'package:healthy_app/features/daily/data/model/weight_model.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../domain/weight.dart';

List<Weight> map(String weight) {
  final weightModelList = WeightListModel.fromJson(jsonDecode(dummyWeightData));

  return weightModelList.weightList
      .map((weightModel) => Weight(weightModel.weight, weightModel.date))
      .toList();
}
