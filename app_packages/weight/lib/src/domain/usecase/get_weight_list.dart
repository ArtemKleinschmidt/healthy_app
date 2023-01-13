import 'package:shared_library/shared_library.dart';

import '../weight.dart';
import '../weight_repository.dart';

class GetWeightList implements UseCase<NoParam, Future<Result<List<Weight>>>> {
  final IWeightRepository weightRepository;

  GetWeightList(
    this.weightRepository,
  );

  @override
  Future<Result<List<Weight>>> call(NoParam parameter) {
    return weightRepository.getWeight();
  }
}
