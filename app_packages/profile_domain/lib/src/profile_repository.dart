import 'package:common_domain/common_domain.dart';
import 'package:profile_domain/src/profile.dart';

abstract class IProfileRepository {
  Future<Result<Profile>> getProfile();
}