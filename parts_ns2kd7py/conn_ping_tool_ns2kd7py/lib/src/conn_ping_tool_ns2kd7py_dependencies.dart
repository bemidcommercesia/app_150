import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'data/repository/conn_ping_tool_ns2kd7py_repository_impl.dart';
import 'presentation/get_controller/conn_ping_tool_ns2kd7py_controller.dart';

abstract class ConnPingToolns2kd7pyDependencies {
  static Future<void> init(Connectivity connectivity) async {
    final repository = Get.put(
      ConnPingToolns2kd7pyRepositoryImpl(connectivity: connectivity),
    );

    final isConnected = await repository.isConnected();

    Get.put(
      ConnPingToolns2kd7pyController(repository: repository, isConnected: isConnected),
    );
  }
}
