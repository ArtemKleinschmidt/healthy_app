import 'dart:math';

import 'package:profile/profile_domain.dart';
import 'package:shared_dependencies/test.dart';
import 'package:shared_library/shared_library.dart';
import 'package:weight/weight_domain.dart';

void main() {
  final repository = ProfileRepositoryMock();
  final getWeightDetails = GetWeightDetails(repository);

  test('repository must be called', () async {
    final profile = _getProfile(1.80);
    final weight = _getWeight(100);

    when(() => repository.getProfile())
        .thenAnswer((_) => Future.value(Success(profile)));

    await getWeightDetails(weight);

    verify(() => repository.getProfile()).called(1);
  });

  group('body types calculation tests', () {
    test('underweight type calculated properly', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(59);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.underweight);
    });

    test('normal type calculated properly. lowest value', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(60);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.normal);
    });

    test('normal type calculated properly. highest value', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(80);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.normal);
    });

    test('overweight type calculated properly. lowest value', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(81);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.overweight);
    });

    test('overweight type calculated properly. highest value', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(129);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.overweight);
    });

    test('obese type calculated properly', () async {
      final profile = _getProfile(180);
      final weight = _getWeight(130);

      when(() => repository.getProfile())
          .thenAnswer((_) => Future.value(Success(profile)));

      final weightDetails =
          await getWeightDetails(weight) as Success<WeightDetails>;

      expect(weightDetails.value.bodyType, BodyType.obese);
    });
  });
}

class ProfileRepositoryMock extends Mock implements IProfileRepository {}

Profile _getProfile(double height) {
  return Profile(
      height: height, birthday: DateTime(1980, 2, 2), gender: Gender.male);
}

Weight _getWeight(double weight) {
  final today = DateTime.now();
  return Weight(Random.secure().nextInt(1000), weight, today);
}
