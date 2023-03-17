import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../controller/stats_controller.dart';
import '../../controller/timer_controller.dart';
import '../../core/constants.dart';

class ResetPage extends GetView<TimerController> {
  ResetPage({super.key});

  final StatsController statsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      key: const Key('reset_page_container'),
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
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                key: const Key('reset_page_back_button'),
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have to restart from \nthe beginning.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                key: const Key('reset_page_confirm_button'),
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
