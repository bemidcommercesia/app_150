import 'package:get_storage/get_storage.dart';

import 'src/presentation/get_controller/run_count_stat_ns2kd7py_controller.dart';
import 'src/run_count_stat_ns2kd7py_dependencies.dart';

export 'src/presentation/widgets/run_count_stat_ns2kd7py_builder.dart';
export 'src/presentation/get_controller/run_count_stat_ns2kd7py_controller.dart';
export 'src/data/repository/run_count_stat_ns2kd7py_repository_impl.dart';

abstract class RunCountStatns2kd7py {
  static Future<void> init() async {
    await GetStorage.init();
    final storage = GetStorage();
    
      
    
    return RunCountStatns2kd7pyDependencies.init(storage);
  }

  
    
  


  static int get counter => RunCountStatns2kd7pyController.to.counter;

  static Future<void> increaseCounter() => RunCountStatns2kd7pyController.to.increaseCounter();
}
