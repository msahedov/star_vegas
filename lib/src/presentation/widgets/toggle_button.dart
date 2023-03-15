import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/stats_controller.dart';
import '../../core/constants.dart';
import '../pages/general_stats_page.dart';
import '../pages/reset_page.dart';

class AppToggleButton extends StatelessWidget {
  AppToggleButton({super.key});
  final StatsController statsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: paddingH5V10,
          child: InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => GeneralStatsPage()),
              child: Container(
                height: 40,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color(0xff242335), borderRadius: borderRadius5),
                child: const Icon(Icons.bar_chart, size: 30),
              )),
        ),
        Obx(
          () {
            return Visibility(
              visible: !statsController.x2.value,
              maintainState: true,
              maintainAnimation: true,
              child: Padding(
                padding: paddingV10,
                child: InkWell(
                    onTap: () => statsController.x2Start(),
                    child: Container(
                        height: 40,
                        width: 70,
                        decoration: const BoxDecoration(
                            color: Color(0xff242335),
                            borderRadius: borderRadius5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "2X",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.flash_on,
                              color: Color(0xFFFFF75A),
                            ),
                          ],
                        ))),
              ),
            );
          },
        ),
        Padding(
          padding: paddingH5V10,
          child: InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => ResetPage()),
              child: Container(
                height: 40,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color(0xff242335), borderRadius: borderRadius5),
                child: const Icon(Icons.restore, size: 30),
              )),
        ),
      ],
    );
  }
}
