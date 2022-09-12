import 'package:equatable/equatable.dart';
import 'package:weight_domain/weight_domain.dart';

class WeightDetails extends Equatable implements Weight {
  final Weight _weight;
  final double bodyMassIndex;
  final BodyType bodyType;

  WeightDetails(this._weight,
      {required this.bodyMassIndex, required this.bodyType});

  @override
  DateTime get date => _weight.date;

  @override
  String formattedDate(String format) {
    return _weight.formattedDate(format);
  }

  @override
  double get weight => _weight.weight;

  @override
  int get id => _weight.id;

  @override
  List<Object?> get props => [..._weight.props, bodyMassIndex, bodyType];
}

enum BodyType {
  underweight,
  normal,
  overweight,
  obese;
}
