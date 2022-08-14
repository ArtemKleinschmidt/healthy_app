import 'package:weight_data/weight_data.dart';
import 'package:weight_domain/weight_domain.dart';

class MyDI {
  static GetWeight getWeight() {
    return GetWeight(WeightRepository(DummyDataStore()));
  }
}
