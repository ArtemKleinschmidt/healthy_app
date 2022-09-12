import 'dart:math';

import 'package:common_domain/common_domain.dart';
import 'package:profile_domain/profile_domain.dart';
import 'package:weight_domain/src/weight_details.dart';
import 'package:weight_domain/weight_domain.dart';

class GetWeightDetails implements UseCase<Weight, Future<Result<WeightDetails>>>{

  final IProfileRepository _profileRepository;

  GetWeightDetails(this._profileRepository);

  @override
  Future<Result<WeightDetails>> call(Weight parameter) async {
    final profileResult = await _profileRepository.getProfile();

    if (profileResult is Failure) return Failure((profileResult as Failure).exception);

    final profile = (profileResult as Success<Profile>).value;
    final bodyMassIndex = getBodyMassIndex(parameter, profile);
    final bodyType = getBodyType(bodyMassIndex);
    final weightDetails = WeightDetails(parameter, bodyMassIndex: bodyMassIndex, bodyType: bodyType);

    return Future.value(Success(weightDetails));
  }

  double getBodyMassIndex(Weight weight, Profile profile) {
    return weight.weight / pow(profile.height / 100, 2);
  }

  BodyType getBodyType(double bodyMassIndex) {
    if (bodyMassIndex <= 18.3) return BodyType.underweight;
    if (bodyMassIndex <= 24.9) return BodyType.normal;
    if (bodyMassIndex <= 39.9) return BodyType.overweight;
    return BodyType.obese;
  }

}