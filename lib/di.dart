import 'package:weight/weight_data.dart';
import 'package:weight/weight_domain.dart';

import 'package:shared_dependencies/get_it.dart';
import 'package:profile/profile_data.dart' as profile;

void registerDependencies() {
  final getIt = GetIt.instance;

  final getWeightList = GetWeightList(WeightRepository(DummyDataStore()));
  getIt.registerSingleton(getWeightList);

  final getWeightDetails =
      GetWeightDetails(profile.ProfileRepository(profile.DummyDataStore()));
  getIt.registerSingleton(getWeightDetails);
}
