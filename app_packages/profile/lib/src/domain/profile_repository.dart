import 'package:shared_library/shared_library.dart';
import 'profile.dart';

abstract class IProfileRepository {
  Future<Result<Profile>> getProfile();
}