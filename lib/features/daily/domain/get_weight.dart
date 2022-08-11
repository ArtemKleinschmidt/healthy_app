import 'package:healthy_app/common/domain/result.dart';
import 'package:healthy_app/common/domain/use_case.dart';
import 'package:healthy_app/features/daily/domain/weight.dart';
import 'package:healthy_app/features/daily/domain/weight_repository.dart';

class GetWeight implements UseCase<NoParam, Future<Result<List<Weight>>>> {

  final IWeightRepository weightRepository;

  GetWeight(this.weightRepository);

  @override
  Future<Result<List<Weight>>> call(NoParam parameter) {
    return weightRepository.getWeight();
  }

}