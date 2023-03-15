import 'dart:async';
import 'package:get/get.dart';

class StatsController extends GetxController {
  late RxInt clicks;
  late RxInt total;
  late RxBool x2;

  @override
  void onInit() {
    clicks = 0.obs;
    total = 0.obs;
    x2 = false.obs;
    super.onInit();
  }

  @override
  void onClose() {
    clicks.close();
    total.close();
    x2.close();
    super.onClose();
  }

  void incrementStats() {
    if (x2.value) {
      clicks++;
      total += 2;
    } else {
      clicks++;
      total++;
    }
  }

  void reset() {
    clicks.value = 0;
    total.value = 0;
    x2.value = false;
    update();
  }

  void x2Start() async {
    x2.value = true;
    update();
    await Future.delayed(const Duration(seconds: 30), () {
      x2.value = false;
      update();
    });
  }
}
