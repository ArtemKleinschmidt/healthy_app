import 'package:shared_dependencies/equatable.dart';

class Profile implements Equatable {
  final double height;
  final DateTime birthday;
  final Gender gender;

  Profile({required this.height, required this.birthday, required this.gender});

  @override
  List<Object?> get props => [height, birthday, gender];

  @override
  bool? get stringify => true;
}

enum Gender {
  male,
  female,
  unknown,
}
