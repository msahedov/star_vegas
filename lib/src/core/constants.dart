import 'package:flutter/material.dart';

/// Gradients
const RadialGradient radialGradient = RadialGradient(colors: [
  Color(0xFF2196F3),
  Color(0xff022F56),
  Color(0xff03122d),
  Color(0xff030218),
]);
final LinearGradient glassMorpLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFFffffff).withOpacity(0.1),
      const Color(0xFFFFFFFF).withOpacity(0.05),
    ],
    stops: const [
      0.1,
      1,
    ]);
final LinearGradient glassBorderGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    const Color(0xFFffffff).withOpacity(0.5),
    const Color((0xFFFFFFFF)).withOpacity(0.5),
  ],
);

/// BorderRadius
const BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5.0));

/// Paddings
const EdgeInsets paddingV10 = EdgeInsets.symmetric(vertical: 10);
const EdgeInsets paddingH5V10 =
    EdgeInsets.symmetric(horizontal: 5, vertical: 10);
const EdgeInsets paddingL30 = EdgeInsets.only(left: 30);
const EdgeInsets paddingR10 = EdgeInsets.only(right: 10);

// Colors
const Color appColorBlack = Color(0xff131212);
const Color appColorWhite = Color(0xffffffff);
const Color appColorWhiteAccent = Color(0xffe4e4e4);
const Color appColorGrey = Color(0xff3d3d3d);
const Color appColorGreyAccent = Color(0xff6c6c6c);
