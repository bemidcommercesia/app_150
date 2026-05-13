import 'package:play_install_referrer/play_install_referrer.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/local/track_source_ns2kd7py_local_datasource_impl.dart';
import 'data/repository/track_source_ns2kd7py_repository_impl.dart';

import 'domain/repository/track_source_ns2kd7py_repository.dart';

final getIt = GetIt.instance;



abstract class TrackSourcens2kd7pyDependencies {
  static Future<void> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    final repository = TrackSourcens2kd7pyRepositoryImpl(
      androidPlayInstallReferrer: PlayInstallReferrer(),
      localDatasource: TrackSourcens2kd7pyLocalDatasourceImpl(
        sharedPreferences: sharedPrefs,
      ),
    );

    

    getIt.registerSingleton<TrackSourcens2kd7pyRepository>(repository);
    await repository.init();
  }
}
