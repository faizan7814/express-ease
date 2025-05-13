import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class MyOutlinedButtonDotedBorder extends StatelessWidget {
  final double? height;
  final double? width;
  final double? roundCorner;
  final String text;
  final Widget? icon;
  final EdgeInsetsGeometry? iconPadding;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final void Function() onPressed;

  const MyOutlinedButtonDotedBorder({
    this.height,
    this.width,
    required this.text,
    this.icon,
    this.iconPadding,
    this.fontSize,
    this.borderColor,
    this.textColor,
    this.roundCorner,
    this.color,
    this.fontWeight,
    this.fontFamily,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? getHeight(48),
      width: width ?? double.infinity,
      child: DottedBorder(
        color: borderColor ?? kpurple,
        strokeWidth: 1,
        dashPattern: const [6, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(roundCorner ?? 5),
        child: SizedBox(
          height: height ?? getHeight(48),
          width: width ?? double.infinity,
          child: InkWell(
            onTap: onPressed,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ??
                      const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 22,
                        color: kpurple,
                      ),
                  SizedBox(
                    width: getWidth(20),
                  ),
                  Text(
                    text,
                    style: paragraph.copyWith(color: kpurple),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
