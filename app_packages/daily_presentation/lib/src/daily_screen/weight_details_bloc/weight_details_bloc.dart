import 'package:bloc/bloc.dart';
import 'package:common_domain/common_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weight_domain/weight_domain.dart';

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
