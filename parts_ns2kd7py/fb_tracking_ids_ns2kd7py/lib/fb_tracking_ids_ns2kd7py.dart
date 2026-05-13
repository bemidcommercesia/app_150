import 'src/fb_tracking_ids_ns2kd7py_dependencies.dart';
import 'src/presentation/util/fb_tracking_ids_ns2kd7py_util.dart';

abstract class FbTrackingIdsns2kd7py {
  static Future<void> init() => FbTrackingIdsns2kd7pyDependencies.init();

  static Future<String?> get getFacebookAnonymousId =>
      FbTrackingIdsns2kd7pyUtil.to.getFacebookAnonymousId();

  static Future<String?> get getAdvertisingId =>
      FbTrackingIdsns2kd7pyUtil.to.getAdvertisingId();
}
