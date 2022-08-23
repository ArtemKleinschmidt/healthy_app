import 'package:json_annotation/json_annotation.dart';
part '../../_generated/src/model/profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final double height;
  final DateTime birthday;
  final Gender gender;

  ProfileModel({required this.height, required this.birthday, required this.gender});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

enum Gender {
  male,
  female,
  unknown,
}
