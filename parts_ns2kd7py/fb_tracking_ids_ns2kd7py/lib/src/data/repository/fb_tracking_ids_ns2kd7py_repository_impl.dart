import 'dart:developer';

import '../../domain/repository/fb_tracking_ids_ns2kd7py_repository.dart';
import '../datasource/local/fb_tracking_ids_ns2kd7py_local_datasource.dart';
import '../datasource/remote/fb_tracking_ids_ns2kd7py_remote_datasource.dart';

class FbTrackingIdsns2kd7pyRepositoryImpl implements FbTrackingIdsns2kd7pyRepository {
  final FbTrackingIdsns2kd7pyLocalDataSource localDataSource;
  final FbTrackingIdsns2kd7pyRemoteDataSource remoteDataSource;

  FbTrackingIdsns2kd7pyRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> init() async {
    await fetchFacebookAnonymousId();
    await fetchAdvertisingId();
  }

  @override
  Future<String?> fetchFacebookAnonymousId() async {
    String? id = await localDataSource.fetchFacebookAnonymousId();
    if (id != null) return id;
    id = await remoteDataSource.fetchFacebookAnonymousId();
    if (id != null) {
      await localDataSource.saveFacebookAnonymousId(id);
    }
    log('id $id', name: 'FB_Module');
    return id;
  }

  @override
  Future<String?> fetchAdvertisingId() async {
    String? id = await localDataSource.fetchAdvertisingId();
    if (id != null) return id;
    id = await remoteDataSource.fetchAdvertisingId();
    if (id != null) {
      await localDataSource.saveAdvertisingId(id);
    }
    log('ad id $id', name: 'FB_Module');

    return id;
  }
}
