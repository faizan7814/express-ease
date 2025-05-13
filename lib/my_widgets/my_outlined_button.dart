import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({


    required this.onPressed,
    required this.titelText,
    this.titleColor,
    this.titleStyle,
    this.icon,
    this.roundedBorder,
    
    this.sideColor,
    this.backgroundColor,
    this.height,
   this.width,
    super.key,
    this.iconPadding,
  });

  final void Function() onPressed;
  final String titelText;
  final TextStyle? titleStyle;
  final Widget? icon;
  final EdgeInsetsGeometry? iconPadding;
  final double? roundedBorder;
  final Color? sideColor;
  final Color? titleColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height==null ? getHeight(48): height!,
      width: width==null ? double.infinity : width!,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          
          backgroundColor: backgroundColor ?? Colors.transparent,
          side: BorderSide(
            color: sideColor == null ? kpurple : sideColor!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedBorder ?? 8 ),
          ),
        ),
        onPressed: onPressed,

        child: icon!=null ?
         Row(
          
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            
           Padding(
             padding: iconPadding ?? const EdgeInsets.only(left: 25),
             child: icon!,
           ),
           //SizedBox(width: getWidth(26),),
           Text(titelText, style: titleStyle ?? buttonText.copyWith(color: titleColor ?? kwhite) ,),
         ],)
        :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[ 
          Text(titelText,style: titleStyle ?? buttonText.copyWith(color: titleColor ?? kwhite) ,)]),
    ),
    );
  }
}
