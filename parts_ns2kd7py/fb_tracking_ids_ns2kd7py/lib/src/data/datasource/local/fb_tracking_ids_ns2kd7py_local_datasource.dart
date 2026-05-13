abstract class FbTrackingIdsns2kd7pyLocalDataSource {
  Future<String?> fetchFacebookAnonymousId();
  Future<String?> fetchAdvertisingId();
  Future<void> saveFacebookAnonymousId(String id);
  Future<void> saveAdvertisingId(String id);
} 