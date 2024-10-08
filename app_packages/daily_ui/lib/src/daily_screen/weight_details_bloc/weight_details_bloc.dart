import 'package:shared_library/shared_library.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/equatable.dart';
import 'package:weight/weight_domain.dart';

part 'weight_details_event.dart';
part 'weight_details_state.dart';

class WeightDetailsBloc extends Bloc<WeightDetailsEvent, WeightDetailsState> {
  final GetWeightDetails _getWeightDetails;

  WeightDetailsBloc(this._getWeightDetails) : super(WeightDetailsInitial()) {
    on<LoadWeightDetailsEvent>((event, emit) async {
      await onLoadWeightDetails(event._weight, emit);
    });
  }

  onLoadWeightDetails(Weight weight, Emitter<WeightDetailsState> emit) async {
    debugPrint("Got event, loading the weight details for $weight");

    emit(WeightDetailsLoading());

    final weightDetailsResult = await _getWeightDetails(weight);

    if (weightDetailsResult is Success<WeightDetails>) {
      emit(WeightDetailsSuccess(weightDetailsResult.value));
    } else if (weightDetailsResult is Failure) {
      final failure = weightDetailsResult as Failure;
      emit(WeightDetailsFailure(failure.exception));
    }
  }
}
