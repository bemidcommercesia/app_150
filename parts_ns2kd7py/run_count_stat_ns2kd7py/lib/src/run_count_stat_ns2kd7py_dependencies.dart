import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/datasources/local/run_count_stat_ns2kd7py_local_datasource_impl.dart';
import 'data/repository/run_count_stat_ns2kd7py_repository_impl.dart';
import 'domain/repository/run_count_stat_ns2kd7py_repository.dart';
import 'presentation/get_controller/run_count_stat_ns2kd7py_controller.dart';

abstract class RunCountStatns2kd7pyDependencies {
  static Future<void> init(GetStorage storage) async {
    final local = RunCountStatns2kd7pyLocalDatasourceImpl(storage: storage);

    final repository = Get.put<RunCountStatns2kd7pyRepository>(
      RunCountStatns2kd7pyRepositoryImpl(local: local),
    );

    final counter = await repository.getCounter();

    Get.put(
      RunCountStatns2kd7pyController(
        counter: counter,
        repository: repository,
      ),
    );
  }
}
