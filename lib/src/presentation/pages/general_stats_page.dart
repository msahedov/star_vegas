import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../controller/stats_controller.dart';
import '../../controller/timer_controller.dart';
import '../../core/constants.dart';

class GeneralStatsPage extends GetView<TimerController> {
  GeneralStatsPage({super.key});

  final StatsController statsController = Get.find();
  static int seconds = 0;
  static int minutes = 0;
  static int hours = 0;

  final SizedBox sizedBox20 = const SizedBox(
    height: 20,
  );
  final TextStyle keyTextStyle = const TextStyle(
      color: Colors.grey, fontSize: 17, fontWeight: FontWeight.bold);
  final TextStyle valueTextStyle = const TextStyle(
      color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);

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
              "GENERAL STATS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            sizedBox20,
            RichText(
                text: TextSpan(text: "TOTAL: ", style: keyTextStyle, children: [
              TextSpan(
                text: statsController.total.string,
                style: valueTextStyle,
              )
            ])),
            sizedBox20,
            RichText(
                text:
                    TextSpan(text: "CLICKS: ", style: keyTextStyle, children: [
              TextSpan(
                text: statsController.clicks.string,
                style: valueTextStyle,
              )
            ])),
            sizedBox20,
            Obx(() {
              seconds = controller.seconds.value % 60;
              minutes = controller.seconds.value ~/ 60;
              hours = controller.seconds.value ~/ 3600;
              return RichText(
                  text:
                      TextSpan(text: "TIME: ", style: keyTextStyle, children: [
                TextSpan(
                  text:
                      "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                  style: valueTextStyle,
                )
              ]));
            }),
          ],
        ),
      ),
    );
  }
}
