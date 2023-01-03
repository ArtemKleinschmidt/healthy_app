
import 'package:common_domain/common_domain.dart';
import 'package:weight/src/data/repository/weight_mapper.dart';

import '../../domain/weight.dart';
import '../../domain/weight_repository.dart';
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