import 'package:common_domain/common_domain.dart';
import 'package:weight/src/domain/weight.dart';

abstract class IWeightRepository {
  Future<Result<List<Weight>>> getWeight();
}