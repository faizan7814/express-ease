import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  final Color? activeColor;
  final Color? unActiveColor;
  final bool active;
  final double? activeWidth;
  final double? unactiveWidth;
  final double? height;

  const Indicators({
    required this.active,
    this.height,
    this.unactiveWidth,
    this.activeWidth,
    this.activeColor,
    this.unActiveColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height ??  getHeight(13),
      width: active ? activeWidth ??  getWidth(45) : unactiveWidth ?? getWidth(13),
      decoration: BoxDecoration(
        color: active ? (activeColor ?? kpurple) : (unActiveColor ?? kpurpleOpacity),
        borderRadius: BorderRadius.circular(7),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
