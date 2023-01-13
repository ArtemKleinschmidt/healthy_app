import 'package:shared_library/shared_library.dart';
import 'package:weight/src/domain/weight.dart';

abstract class IWeightRepository {
  Future<Result<List<Weight>>> getWeight();
}