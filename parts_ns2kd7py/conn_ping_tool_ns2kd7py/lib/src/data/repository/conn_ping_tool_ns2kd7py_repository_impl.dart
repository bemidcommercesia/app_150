import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../domain/repository/conn_ping_tool_ns2kd7py_repository.dart';

bool _resultChecker(List<ConnectivityResult> res) =>
    !res.contains(ConnectivityResult.none);

final _transformer =
    StreamTransformer<List<ConnectivityResult>, bool>.fromHandlers(
  handleData: (res, sink) => sink.add(_resultChecker(res)),
);

class ConnPingToolns2kd7pyRepositoryImpl implements ConnPingToolns2kd7pyRepository {
  static ConnPingToolns2kd7pyRepositoryImpl get to => Get.find();

  const ConnPingToolns2kd7pyRepositoryImpl({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  final Connectivity _connectivity;

  @override
  Future<bool> isConnected() async {
    
    final results = await _connectivity.checkConnectivity();
    return _resultChecker(results);
  }

  

  @override
  Stream<bool> get onConnectionChange =>
      _connectivity.onConnectivityChanged.transform<bool>(_transformer);
}
