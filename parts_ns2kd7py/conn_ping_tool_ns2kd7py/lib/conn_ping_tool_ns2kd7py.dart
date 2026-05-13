import 'src/conn_ping_tool_ns2kd7py_dependencies.dart';
import '/src/data/repository/conn_ping_tool_ns2kd7py_repository_impl.dart';
import '/src/domain/repository/conn_ping_tool_ns2kd7py_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

export 'src/presentation/widgets/conn_ping_tool_ns2kd7py_builder.dart';
export 'src/data/repository/conn_ping_tool_ns2kd7py_repository_impl.dart';

abstract class ConnPingToolns2kd7py {
  

  static Future<void> init() async {
    final connectivity = Connectivity();
    
    return ConnPingToolns2kd7pyDependencies.init(connectivity);
  }

  ConnPingToolns2kd7pyRepository get _repository =>
      ConnPingToolns2kd7pyRepositoryImpl.to;

  Future<bool> get status => _repository.isConnected();
  Stream<bool> get onConnectionStatusChanged => _repository.onConnectionChange;
}
