import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/local/fb_tracking_ids_ns2kd7py_local_datasource_impl.dart';
import 'data/datasource/remote/fb_tracking_ids_ns2kd7py_remote_datasource_impl.dart';
import 'data/repository/fb_tracking_ids_ns2kd7py_repository_impl.dart';
import 'presentation/util/fb_tracking_ids_ns2kd7py_util.dart';

abstract class FbTrackingIdsns2kd7pyDependencies {
  static init() async {
    final sharedPrefences = await SharedPreferences.getInstance();

    final repository = FbTrackingIdsns2kd7pyRepositoryImpl(
      localDataSource: FbTrackingIdsns2kd7pyLocalDataSourceImpl(sharedPrefences),
      remoteDataSource: FbTrackingIdsns2kd7pyRemoteDataSourceImpl(),
    );

    

    await repository.init();

    Get.put(FbTrackingIdsns2kd7pyUtil(repository: repository));
  }
  

}
