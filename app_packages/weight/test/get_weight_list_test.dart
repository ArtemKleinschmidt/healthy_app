import 'package:shared_dependencies/test.dart';
import 'package:shared_library/shared_library.dart';
import 'package:weight/weight_domain.dart';

void main() {
  final repository = WeightRepositoryMock();
  final getWeightList = GetWeightList(repository);

  test('repository must be called', () async {
    when(() => repository.getWeight())
        .thenAnswer((_) => Future.value(Success(List<Weight>.empty())));

    await getWeightList(NoParam());

    verify(() => repository.getWeight()).called(1);
  });
}

class WeightRepositoryMock extends Mock implements IWeightRepository {}
