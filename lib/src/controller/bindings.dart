import 'package:get/get.dart';

import 'diamond_controller.dart';
import 'stats_controller.dart';
import 'timer_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StatsController());
    Get.put(TimerController());
    Get.put(DiamondController());
  }
}
