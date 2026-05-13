import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_input_screen_ns2kd7py/web_input_screen_ns2kd7py.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_input_screen_ns2kd7py_wv_progress_controller.dart';

class WebInputScreenns2kd7pyControllerProvider extends GetxController {
  static WebInputScreenns2kd7pyControllerProvider get to => Get.find();

  WebInputScreenns2kd7pyControllerProvider._();

  late final WebViewController controller;

  static final _loadingProgressController =
      WebInputScreenns2kd7pyFormProgressController.to;

  static Future<WebInputScreenns2kd7pyControllerProvider> create(
    LinkSettingsns2kd7py linkSettings,
  ) async {
    final c = WebInputScreenns2kd7pyControllerProvider._();
    final uri = await _getLink(linkSettings);
    await c._init(uri);
    return c;
  }

  static Future<Uri> _getLink(LinkSettingsns2kd7py linkSettings) async {
    final baseLink = linkSettings.baseLink;

    final futureParams = linkSettings.linkParams.map((p) => p.param);
    final params = await Future.wait(futureParams);
    final joinedParams = params.join('&');


    final link = '$baseLink?$joinedParams';
    _logWebViewUrl('open_link', link);

    return Uri.parse(link);
  }

  Future<void> _init(Uri uri) async {
    _logWebViewUrl('load_request', uri.toString());
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: _loadingProgressController.updateProgress,
          onPageStarted: (url) => _logWebViewUrl('page_started', url),
          onPageFinished: (url) => _logWebViewUrl('page_finished', url),
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            _logWebViewUrl('navigation_request', request.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(uri);
  }

  static void _logWebViewUrl(String event, String url) {
    final message = '[$event] $url';
    log(message, name: 'WEB VIEW');
    debugPrint('WEB VIEW $message');
  }
}
