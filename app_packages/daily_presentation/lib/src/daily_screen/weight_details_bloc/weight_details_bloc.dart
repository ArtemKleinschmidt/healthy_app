
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weight_details_event.dart';
part 'weight_details_state.dart';

class WeightDetailsBloc extends Bloc<WeightDetailsEvent, WeightDetailsState> {
  WeightDetailsBloc() : super(WeightDetailsInitial()) {
    on<WeightDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
