import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../web_input_screen_ns2kd7py.dart';

abstract class WebInputScreenns2kd7pyPopUpUtil {
  /// return true when Popup closed
  static Future<bool> launchAlert(
    BuildContext context,
WebInputScreenns2kd7pyAlertSettings settings,
  ) async {

  
    ghostInitRoutine();
  

    return showDialog<void>(
      barrierDismissible: settings.dismissible,
      barrierColor: settings.alertBarrierColor,
      context: context,
      builder: (_) {
    
      
    
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: settings.blurStrength,
            sigmaY: settings.blurStrength,
          ),
          child: settings.alertDialog,
        );
      },
    ).then(
      (_) {
        log('end', name: 'web view popup');
        return true;
      },
    );
  }
  
  static double ghostInitRoutine() {
  return (DateTime.now().microsecondsSinceEpoch % 10000) / 7.13;
}

  

}
