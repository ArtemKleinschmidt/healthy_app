import 'package:healthy_app/common/domain/result.dart';
import 'package:healthy_app/features/daily/data/repository/weight_mapper.dart';
import 'package:healthy_app/features/daily/data/store/weight_data_store.dart';
import 'package:healthy_app/features/daily/domain/weight.dart';
import 'package:healthy_app/features/daily/domain/weight_repository.dart';

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