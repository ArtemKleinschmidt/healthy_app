import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/equatable.dart';
import 'package:shared_library/shared_library.dart';
import 'package:weight/weight_domain.dart';

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
