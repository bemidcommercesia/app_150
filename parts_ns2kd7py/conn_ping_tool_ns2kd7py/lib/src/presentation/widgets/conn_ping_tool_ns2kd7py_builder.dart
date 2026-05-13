import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get_controller/conn_ping_tool_ns2kd7py_controller.dart';

class ConnPingToolns2kd7pyBuilder extends StatelessWidget {
  const ConnPingToolns2kd7pyBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(bool) builder;

  @override
  Widget build(BuildContext context) {
    

    return Obx(() {
      final isConnected = ConnPingToolns2kd7pyController.to.isConnected;
      return builder(isConnected);
    });
  }

  
}
