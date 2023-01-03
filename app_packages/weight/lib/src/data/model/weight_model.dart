import 'package:json_annotation/json_annotation.dart';
part '../../../_generated/src/data/model/weight_model.g.dart';

@JsonSerializable()
class WeightListModel {
  final List<WeightModel> weightList;

  WeightListModel(this.weightList);

  factory WeightListModel.fromJson(Map<String, dynamic> json) => _$WeightListModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeightListModelToJson(this);
}

@JsonSerializable()
class WeightModel {
  final int id;
  final double weight;
  final DateTime date;

  const WeightModel(this.id, this.weight, this.date,);

  factory WeightModel.fromJson(Map<String, dynamic> json) => _$WeightModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeightModelToJson(this);
}