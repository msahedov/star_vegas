import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var seconds = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }

  /// Start Timer
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
    });
  }

  /// Stop Timer
  void stopTimer() {
    timer?.cancel();
    update();
  }

  /// is Timer Active?
  bool isTimerRuning() {
    return timer == null ? false : timer!.isActive;
  }
}
