import 'package:profile_data/profile_data.dart' as profile_data;
import 'package:weight_data/weight_data.dart';
import 'package:weight_domain/weight_domain.dart';

class MyDI {
  static GetWeightList getWeightList() {
    return GetWeightList(WeightRepository(DummyDataStore()));
  }

  static GetWeightDetails getWeightDetails() {
    return GetWeightDetails(
        profile_data.ProfileRepository(profile_data.DummyDataStore()));
  }
}
