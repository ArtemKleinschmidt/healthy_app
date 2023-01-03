import 'package:profile/profile.dart' as profile;
import 'package:weight_data/weight_data.dart';
import 'package:weight_domain/weight_domain.dart';

class MyDI {
  static GetWeightList getWeightList() {
    return GetWeightList(WeightRepository(DummyDataStore()));
  }

  static GetWeightDetails getWeightDetails() {
    return GetWeightDetails(
        profile.ProfileRepository(profile.DummyDataStore())
    );
  }
}
