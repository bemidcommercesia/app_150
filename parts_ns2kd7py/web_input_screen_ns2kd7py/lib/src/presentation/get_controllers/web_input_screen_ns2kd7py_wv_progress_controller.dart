import 'package:get/get.dart';

class WebInputScreenns2kd7pyFormProgressController extends GetxController {
  static WebInputScreenns2kd7pyFormProgressController get to => Get.find();

  WebInputScreenns2kd7pyFormProgressController() : _progress = RxInt(0);

  final RxInt _progress;

  void updateProgress(int progress) => _progress.value = progress;
  int get progress => _progress.value;
}
