import 'package:healthy_app/features/daily/domain/weight.dart';

import '../../../common/domain/result.dart';

abstract class IWeightRepository {
  Future<Result<List<Weight>>> getWeight();
}