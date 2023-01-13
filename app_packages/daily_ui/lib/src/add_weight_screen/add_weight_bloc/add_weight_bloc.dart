import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/equatable.dart';

part 'add_weight_event.dart';
part 'add_weight_state.dart';

class AddWeightBloc extends Bloc<AddWeightEvent, AddWeightState> {
  AddWeightBloc() : super(AddWeightInitial()) {
    on<SaveWeightEvent>((event, emit) {
      debugPrint(event.toString());
    });
  }
}
