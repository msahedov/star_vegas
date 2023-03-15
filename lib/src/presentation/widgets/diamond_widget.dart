import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../controller/diamond_controller.dart';
import '../../controller/stats_controller.dart';

class DiamondWidget extends StatefulWidget {
  const DiamondWidget({super.key});

  @override
  State<DiamondWidget> createState() => _DiamondWidgetState();
}

class _DiamondWidgetState extends State<DiamondWidget>
    with TickerProviderStateMixin {
  late AnimationController _roteteController;
  late AnimationController _sizeAnmController;
  late Animation<double> _sizeAnimation;

  final AudioPlayer _player = AudioPlayer();
  final DiamondController _diamondController = Get.find();
  final StatsController _statsController = Get.find();

  @override
  void initState() {
    super.initState();
    _roteteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _sizeAnmController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      reverseDuration: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 120),
    );

    _sizeAnimation =
        Tween<double>(begin: 130, end: 150).animate(_sizeAnmController);
  }

  @override
  void dispose() {
    _roteteController.dispose();
    _sizeAnmController.dispose();
    _player.dispose();
    _statsController.dispose();
    _diamondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _roteteController,
      builder: (_, __) {
        return Transform.rotate(
          angle: _roteteController.value * 4 * math.pi,
          child: InkWell(
            onTap: diamondClick,
            child: AnimatedBuilder(
                animation: _sizeAnmController,
                builder: (___, ____) {
                  return Obx(() => Hero(
                        tag: _diamondController
                            .diamons[_diamondController.diamondIndex.value],
                        child: SvgPicture.asset(
                          _diamondController
                              .diamons[_diamondController.diamondIndex.value],
                          fit: BoxFit.contain,
                          width: _sizeAnimation.value,
                          height: _sizeAnimation.value,
                          matchTextDirection: true,
                        ),
                      ));
                }),
          ),
        );
      },
    );
  }

  Future<void> diamondClick() async {
    await _player.play(AssetSource('music/diamond-click.mp3'),
        position: const Duration(milliseconds: 200),
        mode: PlayerMode.mediaPlayer);

    _sizeAnmController.forward();
    if (_sizeAnmController.isCompleted) {
      _sizeAnmController.reset();
    }
    _sizeAnmController.forward();
    _statsController.incrementStats();
  }
}
