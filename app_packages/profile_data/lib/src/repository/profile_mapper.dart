import 'dart:convert';

import 'package:profile_data/src/model/profile_model.dart' hide Gender;
import 'package:profile_data/src/model/profile_model.dart' as model show Gender;
import 'package:profile_domain/profile_domain.dart';

Profile map(String rawProfile) {
  ProfileModel profileModel = ProfileModel.fromJson(jsonDecode(rawProfile));

  return Profile(
      height: profileModel.height,
      birthday: profileModel.birthday,
      gender: mapGender(profileModel.gender));
}

Gender mapGender(model.Gender gender) {
  switch (gender) {
    case model.Gender.male:
      return Gender.male;
    case model.Gender.female:
      return Gender.female;
    case model.Gender.unknown:
      return Gender.unknown;
  }
}
