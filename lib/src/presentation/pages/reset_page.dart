import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../controller/stats_controller.dart';
import '../../controller/timer_controller.dart';
import '../../core/constants.dart';

class ResetPage extends GetView<TimerController> {
  ResetPage({super.key});

  final StatsController statsController = Get.find();

  final SizedBox sizedBox20 = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 300,
      height: 300,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.topLeft,
      border: 0,
      linearGradient: glassMorpLinearGradient,
      borderGradient: glassBorderGradient,
      child: Padding(
        padding: paddingL30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            sizedBox20,
            OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.navigate_before),
                label: const Text("BACK")),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "REBIRTH?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            sizedBox20,
            const Text(
              "You have to restart from \nthe beginning.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            sizedBox20,
            OutlinedButton(
                onPressed: () {
                  controller.seconds.value = 0;
                  statsController.reset();
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xff242335),
                    foregroundColor: Colors.white),
                child: const Text("YES")),
          ],
        ),
      ),
    );
  }
}
