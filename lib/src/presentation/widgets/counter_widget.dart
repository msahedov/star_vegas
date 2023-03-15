import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../controller/stats_controller.dart';

class CounterWidget extends GetView<StatsController> {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingR10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(
            () => Text(
              controller.total.value.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(
            Icons.flash_on,
            color: Color(0xFFFFF75A),
          ),
        ],
      ),
    );
  }
}
