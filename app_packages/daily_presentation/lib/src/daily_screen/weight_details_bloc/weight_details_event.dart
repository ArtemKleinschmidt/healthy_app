part of 'weight_details_bloc.dart';

abstract class WeightDetailsEvent extends Equatable {
  const WeightDetailsEvent();
}

class LoadWeightDetailsEvent extends WeightDetailsEvent {
  final Weight _weight;

  const LoadWeightDetailsEvent(this._weight);

  @override
  List<Object?> get props => [_weight];
}
