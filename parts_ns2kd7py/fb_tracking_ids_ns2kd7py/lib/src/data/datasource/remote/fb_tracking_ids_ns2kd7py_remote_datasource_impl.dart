import 'fb_tracking_ids_ns2kd7py_remote_datasource.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:advertising_id/advertising_id.dart';

class FbTrackingIdsns2kd7pyRemoteDataSourceImpl
    implements FbTrackingIdsns2kd7pyRemoteDataSource {
  @override
  Future<String?> fetchFacebookAnonymousId() async {
    return await FacebookAppEvents().getAnonymousId();
  }

  

  @override
  Future<String?> fetchAdvertisingId() async {
    
    return await AdvertisingId.id(true);
  }
}
