import 'package:profile/profile.dart' as profile;
import 'package:weight/weight.dart';

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
