import 'package:conn_ping_tool_ns2kd7py/conn_ping_tool_ns2kd7py.dart';
import 'package:flutter/material.dart';
import 'package:web_input_screen_ns2kd7py/web_input_screen_ns2kd7py.dart';

import '../../../../core/services_ns2kd7py/appsflyer_analytics_ns2kd7py/appsflyer_wrapper_ns2kd7py.dart';
import 'web_viewer_ns2kd7py_no_connection_screen.dart';



class WebViewerNs2kd7pyScreen extends StatefulWidget {
  const WebViewerNs2kd7pyScreen({super.key});

  @override
  State<WebViewerNs2kd7pyScreen> createState() => _WebViewerNs2kd7pyScreenState();
}

class _WebViewerNs2kd7pyScreenState extends State<WebViewerNs2kd7pyScreen> {
  @override
  void initState() {
    super.initState();
    AppsflyerAnalyticsNs2kd7py.logWVOpen();
  }

  @override
  Widget build(BuildContext context) {
    return ConnPingToolns2kd7pyBuilder(
      builder: (isConnected) {
        return WebInputScreenns2kd7pyScreen.noConnectionPlaceholder(
          isConnected: isConnected,
          noConnectionPlaceholder: WebViewerNs2kd7pyNoConnectionScreen(),
          webViewScreenSetting: WebInputScreenns2kd7pyScreenSetting(
            backgroundColor: const Color(0xFF0D0D0C),
            headerSettings: HeaderSettingsns2kd7py.widget(
              widget: const _WebViewerHeader(),
            ),
            loadingIndicatorSettings: const ProgressIndicatorSettingsns2kd7py(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF0D0D0C),
            ),
          ),
        );
      },
    );
  }
}

class _WebViewerHeader extends StatelessWidget {
  const _WebViewerHeader();

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return ColoredBox(
      color: const Color(0xFF0D0D0C),
      child: Column(
        children: [
          SizedBox(height: top),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  behavior: HitTestBehavior.opaque,
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Choose Your Amount',
                    style: TextStyle(
                      fontFamily: 'MPLUS1',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
