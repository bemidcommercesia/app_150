import 'package:get_storage/get_storage.dart';

import 'run_count_stat_ns2kd7py_local_datasource.dart';

class RunCountStatns2kd7pyLocalDatasourceImpl implements RunCountStatns2kd7pyLocalDatasource {
  static const _key = 'launch_counter';

  const RunCountStatns2kd7pyLocalDatasourceImpl({
    required GetStorage storage,
  }) : _storage = storage;

  final GetStorage _storage;

  @override
  Future<int> getCounter() async {
    return _storage.read<int>(_key) ?? 0;
  }

  @override
  Future<void> saveCounter(int counter) async {
    return _storage.write(_key, counter);
  }
}
