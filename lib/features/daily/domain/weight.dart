import 'package:equatable/equatable.dart';

class Weight extends Equatable {
  final double weight;
  final DateTime date;

  const Weight(this.weight, this.date);

  @override
  List<Object?> get props => [weight, date];

}