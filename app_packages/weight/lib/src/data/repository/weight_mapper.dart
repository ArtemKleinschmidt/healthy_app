import 'dart:convert';

import '../../domain/weight.dart';
import '../dummy_data/dummy_data.dart';
import '../model/weight_model.dart';

List<Weight> map(String weight) {
  final weightModelList = WeightListModel.fromJson(jsonDecode(dummyWeightData));

  return weightModelList.weightList
      .map((weightModel) =>
          Weight(weightModel.id, weightModel.weight, weightModel.date))
      .toList();
}
