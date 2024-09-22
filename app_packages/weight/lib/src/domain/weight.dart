import 'package:shared_dependencies/equatable.dart';
import 'package:shared_dependencies/intl.dart';

class Weight extends Equatable {
  final int id;
  final double weight;
  final DateTime date;

  const Weight(
    this.id,
    this.weight,
    this.date,
  );

  @override
  List<Object?> get props => [weight, date];

  String formattedDate(String format) {
    return DateFormat(format).format(date);
  }
}
