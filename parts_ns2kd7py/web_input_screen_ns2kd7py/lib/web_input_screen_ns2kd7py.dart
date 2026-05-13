import 'package:get/get.dart';

import 'package:web_input_screen_ns2kd7py/web_input_screen_ns2kd7py.dart';
import 'src/presentation/get_controllers/web_input_screen_ns2kd7py_wv_controller_controller.dart';
import 'src/presentation/get_controllers/web_input_screen_ns2kd7py_wv_progress_controller.dart';

export 'src/presentation/models/web_input_screen_ns2kd7py_screen_settings.dart';
export 'src/presentation/screens/web_input_screen_ns2kd7py_screen.dart';

abstract class WebInputScreenns2kd7pyDependencies {
  static Future<void> preload({
    required LinkSettingsns2kd7py linkSettings,
  }) async {
    Get.put<WebInputScreenns2kd7pyFormProgressController>(WebInputScreenns2kd7pyFormProgressController());

    await Get.putAsync<WebInputScreenns2kd7pyControllerProvider>(
      () async => await WebInputScreenns2kd7pyControllerProvider.create(linkSettings),
    );
  }
}
