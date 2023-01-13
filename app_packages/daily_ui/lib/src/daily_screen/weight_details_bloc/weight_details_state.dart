part of 'weight_details_bloc.dart';

abstract class WeightDetailsState extends Equatable {
  const WeightDetailsState();
}

class WeightDetailsInitial extends WeightDetailsState {
  @override
  List<Object> get props => [];
}

class WeightDetailsLoading extends WeightDetailsState {
  @override
  List<Object?> get props => [];
}

class WeightDetailsSuccess extends WeightDetailsState {
  final WeightDetails weightDetails;
  const WeightDetailsSuccess(this.weightDetails);

  @override
  List<Object?> get props => [weightDetails];
}

class WeightDetailsFailure extends WeightDetailsState {
  final Exception _exception;

  const WeightDetailsFailure(this._exception);

  @override
  List<Object?> get props => [_exception];
}