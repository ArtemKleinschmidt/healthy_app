import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/common/domain/result.dart';

import '../../../common/domain/use_case.dart';
import '../domain/get_weight.dart';
import '../domain/weight.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  final GetWeight getWeight;

  WeightBloc(this.getWeight) : super(WeightInitial()) {

    on<LoadWeightEvent>((event, emit) async {
         await onLoadWeight(emit);
    });

  }

  Future<void> onLoadWeight(Emitter<WeightState> emit) async {
    debugPrint("Got event, loading the weight");

    emit(WeightLoading());

    final weightResult = await getWeight(NoParam());

    if (weightResult is Success) {
      final success = weightResult as Success<List<Weight>>;
      emit(WeightSuccess(success.value));
    } else if (weightResult is Failure) {
      final failure = weightResult as Failure;
      emit(WeightFailure(failure.exception));
    }
  }

}
