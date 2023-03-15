import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'diamond_widget.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: radialGradient),
      alignment: Alignment.center,
      child: const DiamondWidget(),
    );
  }
}
