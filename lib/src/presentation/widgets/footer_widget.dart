import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/diamond_controller.dart';

class FooterWidget extends GetView<DiamondController> {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => OutlinedButton(
                onPressed: () => controller.setIndex(index),
                style:
                    OutlinedButton.styleFrom(fixedSize: const Size(60.0, 60.0)),
                child: Hero(
                    tag: controller.diamons[index],
                    child: SvgPicture.asset(
                      controller.diamons[index],
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ))));
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 4,
        ),
      ),
    );
  }
}
