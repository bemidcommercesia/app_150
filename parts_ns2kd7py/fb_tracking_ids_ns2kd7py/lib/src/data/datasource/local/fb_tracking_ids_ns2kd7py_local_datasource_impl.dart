import 'package:shared_preferences/shared_preferences.dart';

import 'fb_tracking_ids_ns2kd7py_local_datasource.dart';

class FbTrackingIdsns2kd7pyLocalDataSourceImpl
    implements FbTrackingIdsns2kd7pyLocalDataSource {
  static const String _facebookAnonymousIdKey = 'facebook_anonymous_id';
  static const String _advertisingIdKey = 'advertising_id';

  FbTrackingIdsns2kd7pyLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<String?> fetchFacebookAnonymousId() async {
    return sharedPreferences.getString(_facebookAnonymousIdKey);
  }

  @override
  Future<String?> fetchAdvertisingId() async {
    
    return sharedPreferences.getString(_advertisingIdKey);
  }

  @override
  Future<void> saveFacebookAnonymousId(String id) async {
    await sharedPreferences.setString(_facebookAnonymousIdKey, id);
  }

  @override
  Future<void> saveAdvertisingId(String id) async {
    await sharedPreferences.setString(_advertisingIdKey, id);
    
  }
}
