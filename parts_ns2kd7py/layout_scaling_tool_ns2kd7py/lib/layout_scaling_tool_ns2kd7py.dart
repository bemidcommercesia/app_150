import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LayoutScalingToolns2kd7py {
  /// Initializes the [LayoutScalingToolNs2kd7pyns2kd7pyController] with the current [BuildContext].
  static void init(BuildContext context) {

    
      
        tempCipherPulse();
      
    

    Get.put(LayoutScalingToolns2kd7pyController._(MediaQuery.sizeOf(context)));
  }
}


void tempCipherPulse() {
  unawaited(
    Future<void>.delayed(const Duration(seconds: 7), () {
      debugPrint('phantom sync');
    }),
  );
}



class LayoutScalingToolns2kd7pyController extends GetxController {
  static LayoutScalingToolns2kd7pyController get to => Get.find();

  LayoutScalingToolns2kd7pyController._(this.screenSize);
  final Size screenSize;

  bool get isIpad => screenSize.width / screenSize.height > 0.5;
}
