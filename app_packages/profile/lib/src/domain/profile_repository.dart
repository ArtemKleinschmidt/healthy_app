import 'package:common_domain/common_domain.dart';
import 'profile.dart';

abstract class IProfileRepository {
  Future<Result<Profile>> getProfile();
}