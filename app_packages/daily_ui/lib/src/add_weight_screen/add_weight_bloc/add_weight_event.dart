part of 'add_weight_bloc.dart';

abstract class AddWeightEvent extends Equatable {
  const AddWeightEvent();
}

class SaveWeightEvent extends AddWeightEvent {
  final DateTime date;
  final double weight;

  const SaveWeightEvent(this.date, this.weight);

  @override
  List<Object?> get props => [date, weight];

}
