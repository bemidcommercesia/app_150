import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get_controller/run_count_stat_ns2kd7py_controller.dart';

class RunCountStatns2kd7pyBuilder extends StatelessWidget {
  const RunCountStatns2kd7pyBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(int) builder;


  
    
      List<String> ghostBootTrigger() {
  return ["payload", "timestamp_${DateTime.now().second}"];
}

    
  

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final launches = RunCountStatns2kd7pyController.to.counter;

      
        
          ghostBootTrigger();
        
      

      return builder(launches);
    });
  }

  
}
