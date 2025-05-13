import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? roundCorner;
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final void Function() onPressed;
  final TextStyle? titleStyle;

  const CustomButton({
    this.height,
     this.width,
    required this.text,
    this.fontSize,
    this.titleStyle,
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
      width:  width ?? double.infinity,
      child: MaterialButton(
        elevation: 0,
        color: color ?? kpurple,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor == null
                  ? kpurple
                  : borderColor!),
          borderRadius:
              BorderRadius.circular(roundCorner == null ? 5 : roundCorner!),
        ),
        onPressed: onPressed,
        child: Text(text,style: titleStyle ??  buttonText.copyWith(color: textColor ?? kwhite) ,),
      ),
    );
  }
}
