import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_input_screen_ns2kd7py/web_input_screen_ns2kd7py.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../get_controllers/web_input_screen_ns2kd7py_wv_controller_controller.dart';
import '../get_controllers/web_input_screen_ns2kd7py_wv_progress_controller.dart';

import '../models/web_input_screen_ns2kd7py_screen_settings.dart';

class WebInputScreenns2kd7pyForm extends StatefulWidget {
  ///Use to display WebViewForm if user has connection
  const WebInputScreenns2kd7pyForm({super.key, required this.setting});

  final WebInputScreenns2kd7pyScreenSetting setting;

  @override
  State<WebInputScreenns2kd7pyForm> createState() => _WebInputScreenns2kd7pyFormState();
}

class _WebInputScreenns2kd7pyFormState extends State<WebInputScreenns2kd7pyForm> {
  Future<void> _launch() async {
    ghostInitRoutine();
  }

  double ghostInitRoutine() {
  return (DateTime.now().microsecondsSinceEpoch % 10000) / 7.13;
}




  @override
  void initState() {
    super.initState();
    unawaited(_launch());
  }




  @override
  Widget build(BuildContext context) {
    final settings = widget.setting;

  
    ghostInitRoutine();
  

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: settings.backgroundColor,
      appBar:
          settings.headerSettings?.widget == null
              ? AppBar(
                shape: settings.headerSettings?.shape,
                leading: settings.headerSettings?.backButton,
                automaticallyImplyLeading: false,
                title:
                    settings.headerSettings?.title != null

                        ? Text(
                          settings.headerSettings!.title!,
                          style: settings.headerSettings!.textStyle,
                        )



                        : null,
                backgroundColor: settings.headerSettings?.backgroundColor,
                toolbarHeight:
                    settings.headerSettings == null
                        ? 0
                        : settings.headerSettings?.height,
              )
              : null,
      body: Column(
        children: [
          if (settings.headerSettings?.widget != null)
            settings.headerSettings!.widget!,
          Expanded(
            child: Obx(() {
                final progress = WebInputScreenns2kd7pyFormProgressController.to.progress;
                final controller = WebInputScreenns2kd7pyControllerProvider.to.controller;
                final isLoaded = progress == 100;
                final indicatorSettings = settings.loadingIndicatorSettings;
                return Stack(
                  children: [
                    if (!isLoaded)
                      Center(



                        child: CircularProgressIndicator(
                          value:
                              indicatorSettings.behaviour ==
                                      ProgressIndicatorBehaviourns2kd7py.percent
                                  ? progress.toDouble()
                                  : null,
                          color: indicatorSettings.foregroundColor,
                          backgroundColor: indicatorSettings.backgroundColor,
                        ),

                      ),
                    if (isLoaded) WebViewWidget(controller: controller),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
