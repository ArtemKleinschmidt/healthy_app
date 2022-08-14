import 'package:common_domain/common_domain.dart';

import '../weight_domain.dart';

class GetWeight implements UseCase<NoParam, Future<Result<List<Weight>>>> {

  final IWeightRepository weightRepository;

  GetWeight(this.weightRepository);

  @override
  Future<Result<List<Weight>>> call(NoParam parameter) {
    return weightRepository.getWeight();
  }

}