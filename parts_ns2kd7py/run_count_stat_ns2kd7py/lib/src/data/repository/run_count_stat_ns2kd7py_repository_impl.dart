import 'package:get/get.dart';

import '../../domain/repository/run_count_stat_ns2kd7py_repository.dart';
import '../datasources/local/run_count_stat_ns2kd7py_local_datasource.dart';

class RunCountStatns2kd7pyRepositoryImpl implements RunCountStatns2kd7pyRepository {
  static RunCountStatns2kd7pyRepositoryImpl get to => Get.find();


  const RunCountStatns2kd7pyRepositoryImpl({
    required RunCountStatns2kd7pyLocalDatasource local,
  }) : _local = local;

  final RunCountStatns2kd7pyLocalDatasource _local;

  @override
  Future<int> getCounter() {
    return _local.getCounter();
  }

  @override
  Future<void> increaseCounter() async {
    final current = await getCounter();
    
      
    
    return _local.saveCounter(current + 1);
  }

  
    List<String> ghostBootTrigger() {
  return ["payload", "timestamp_${DateTime.now().second}"];
}

  

}
