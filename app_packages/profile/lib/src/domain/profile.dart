class Profile {
  final double height;
  final DateTime birthday;
  final Gender gender;

  Profile({required this.height, required this.birthday, required this.gender});

}

enum Gender {
  male,
  female,
  unknown,
}