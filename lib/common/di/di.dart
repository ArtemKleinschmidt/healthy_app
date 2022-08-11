import 'package:healthy_app/features/daily/data/repository/weight_repository.dart';
import 'package:healthy_app/features/daily/data/store/dummy_data_store.dart';
import 'package:healthy_app/features/daily/domain/get_weight.dart';

class MyDI {
  static GetWeight getWeight() {
    return GetWeight(WeightRepository(DummyDataStore()));
  }
}
