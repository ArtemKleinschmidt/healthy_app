import 'package:common_domain/common_domain.dart';
import 'package:profile_data/src/repository/profile_mapper.dart';
import 'package:profile_data/src/store/profile_data_store.dart';
import 'package:profile_domain/profile_domain.dart';

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