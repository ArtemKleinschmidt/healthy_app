part of 'weight_bloc.dart';

abstract class WeightState extends Equatable {
  const WeightState();
}

class WeightInitial extends WeightState {
  @override
  List<Object> get props => [];
}

class WeightLoading extends WeightState {
  @override
  List<Object?> get props => [];
}

class WeightSuccess extends WeightState {
  final List<Weight> weightList;

  const WeightSuccess(this.weightList);

  @override
  List<Object?> get props => weightList;
}

class WeightFailure extends WeightState {
  final Exception exception;

  const WeightFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}
