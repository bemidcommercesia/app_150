import 'src/track_source_ns2kd7py_dependencies.dart';

import 'src/domain/repository/track_source_ns2kd7py_repository.dart';

abstract class TrackSourcens2kd7py {
  static Future<void> init() => TrackSourcens2kd7pyDependencies.init();

  static final _repository = getIt<TrackSourcens2kd7pyRepository>();

  static String get details => _repository.getDetails();
}
