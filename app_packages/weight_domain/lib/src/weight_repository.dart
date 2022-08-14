import 'package:common_domain/common_domain.dart';
import '../weight_domain.dart';

abstract class IWeightRepository {
  Future<Result<List<Weight>>> getWeight();
}