
import 'package:common_domain/common_domain.dart';
import 'package:weight_data/src/repository/weight_mapper.dart';
import 'package:weight_domain/weight_domain.dart';

import '../store/weight_data_store.dart';

class WeightRepository implements IWeightRepository {
  final WeightDataStore weightDataStore;

  WeightRepository(this.weightDataStore);

  @override
  Future<Result<List<Weight>>> getWeight() {
    return getResultFuture(() async {
      final weight = await weightDataStore.getWeight();
      return map(weight);
    });
  }

}