import 'dart:async';

import 'package:common_domain/common_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_domain/weight_domain.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  final GetWeightList getWeight;

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
