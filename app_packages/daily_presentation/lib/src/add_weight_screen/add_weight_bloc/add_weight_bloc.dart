import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_weight_event.dart';
part 'add_weight_state.dart';

class AddWeightBloc extends Bloc<AddWeightEvent, AddWeightState> {
  AddWeightBloc() : super(AddWeightInitial()) {
    on<SaveWeightEvent>((event, emit) {
      debugPrint(event.toString());
    });
  }
}
