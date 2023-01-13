import 'package:shared_library/shared_library.dart';
import 'package:profile/src/data/repository/profile_mapper.dart';

import '../../domain/profile.dart';
import '../../domain/profile_repository.dart';
import '../store/profile_data_store.dart';

class ProfileRepository implements IProfileRepository {

  final ProfileDataStore profileDataStore;

  ProfileRepository(this.profileDataStore);

  @override
  Future<Result<Profile>> getProfile() {
    return getResultFuture(() async {
      final profile = await profileDataStore.getProfile();
      return map(profile);
    });
  }

}