import 'package:get/get.dart';

import '../../domain/repository/conn_ping_tool_ns2kd7py_repository.dart';

class ConnPingToolns2kd7pyController extends GetxController {
  static ConnPingToolns2kd7pyController get to => Get.find();

  ConnPingToolns2kd7pyController({
    required ConnPingToolns2kd7pyRepository repository,
    required bool isConnected,
  })  : _isConnected = RxBool(isConnected),
        _repository = repository;

  final ConnPingToolns2kd7pyRepository _repository;
  final RxBool _isConnected;
  bool get isConnected => _isConnected.value;

  @override
  void onInit() {
    _repository.onConnectionChange.listen((val) {
      _isConnected.value = val;
    });
    super.onInit();
  }
}
