import 'package:profile/src/data/store/profile_data_store.dart';

import '../dummy_data/dummy_data.dart';

class DummyDataStore extends ProfileDataStore {
  @override
  Future<String> getProfile() {
    return Future.delayed(const Duration(seconds: 2), () => dummyProfileData);
  }
}
