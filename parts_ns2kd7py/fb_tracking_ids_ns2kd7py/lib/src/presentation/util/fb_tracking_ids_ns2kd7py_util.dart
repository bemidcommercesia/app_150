import 'package:get/get.dart';

import '../../domain/repository/fb_tracking_ids_ns2kd7py_repository.dart';

class FbTrackingIdsns2kd7pyUtil {
  static FbTrackingIdsns2kd7pyUtil get to => Get.find();
  final FbTrackingIdsns2kd7pyRepository repository;

  FbTrackingIdsns2kd7pyUtil({required this.repository});

  Future<String?> getFacebookAnonymousId() =>
      repository.fetchFacebookAnonymousId();

  Future<String?> getAdvertisingId() => repository.fetchAdvertisingId();
}
