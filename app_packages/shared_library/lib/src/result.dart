abstract class Result<T> {}

class Success<T> implements Result<T> {
  final T value;

  Success(this.value);
}

class Failure<T> implements Result<T> {
  final Exception exception;

  Failure(this.exception);
}

Result<T> getResult<T>(T Function() function) {
  try {
    return Success(function());
  } on Exception catch (e) {
    return Failure(e);
  }
}

Future<Result<T>> getResultFuture<T>(Future<T> Function() function) async {
  try {
    final result = await function();
    return Success(result);
  } on Exception catch (e) {
    return Failure(e);
  }
}
