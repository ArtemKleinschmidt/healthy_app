import 'package:profile/profile_data.dart' as profile;
import 'package:weight/weight_data.dart';
import 'package:weight/weight_domain.dart';

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
