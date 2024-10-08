import 'dart:math';

import 'package:shared_library/shared_library.dart';
import 'package:profile/profile_domain.dart';

import '../weight.dart';
import '../weight_details.dart';

class GetWeightDetails
    implements UseCase<Weight, Future<Result<WeightDetails>>> {
  final IProfileRepository _profileRepository;

  GetWeightDetails(this._profileRepository);

  @override
  Future<Result<WeightDetails>> call(Weight parameter) async {
    final profileResult = await _profileRepository.getProfile();

    if (profileResult is Failure) {
      return Failure((profileResult as Failure).exception);
    }

    final profile = (profileResult as Success<Profile>).value;
    final bodyMassIndex = _getBodyMassIndex(parameter, profile);
    final bodyType = _getBodyType(bodyMassIndex);
    final weightDetails = WeightDetails(parameter,
        bodyMassIndex: bodyMassIndex, bodyType: bodyType);

    return Future.value(Success(weightDetails));
  }

  double _getBodyMassIndex(Weight weight, Profile profile) {
    return weight.weight / pow(profile.height / 100, 2);
  }

  BodyType _getBodyType(double bodyMassIndex) {
    if (bodyMassIndex <= 18.3) return BodyType.underweight;
    if (bodyMassIndex <= 24.9) return BodyType.normal;
    if (bodyMassIndex <= 39.9) return BodyType.overweight;
    return BodyType.obese;
  }
}
