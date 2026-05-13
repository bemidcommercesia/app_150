import 'package:get/get.dart';
import '../../domain/repository/run_count_stat_ns2kd7py_repository.dart';

class RunCountStatns2kd7pyController extends GetxController {
  static RunCountStatns2kd7pyController get to => Get.find();
  final RunCountStatns2kd7pyRepository _repository;

  RunCountStatns2kd7pyController({
    required int counter,
    required RunCountStatns2kd7pyRepository repository,
  }) : _counter = RxInt(counter),
       _repository = repository;

  late final RxInt _counter;

  int get counter => _counter.value;
  bool get isFirstLaunch => counter == 1;

  Future<void> increaseCounter() {
    _counter.value = _counter.value + 1;
    return _repository.increaseCounter();
  }
}
