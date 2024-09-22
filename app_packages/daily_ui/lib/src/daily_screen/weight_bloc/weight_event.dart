part of 'weight_bloc.dart';

abstract class WeightEvent extends Equatable {
  const WeightEvent();
}

class LoadWeightEvent extends WeightEvent {
  @override
  List<Object?> get props => [];
}
