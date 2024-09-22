import 'package:weight/src/data/store/weight_data_store.dart';

import '../dummy_data/dummy_data.dart';

class DummyDataStore implements WeightDataStore {
  @override
  Future<String> getWeight() {
    return Future.delayed(const Duration(seconds: 2), () => dummyWeightData);
  }
}
