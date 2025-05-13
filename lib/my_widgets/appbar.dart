import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {required this.title,
      this.trailing,
      this.titleColor,
      this.height,
      this.backgroundColor,
      this.foregroundColor,
      this.centerTitle,
      super.key});

  final String title;
  final Color? titleColor;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? centerTitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      centerTitle: centerTitle ?? true,
      backgroundColor: backgroundColor ?? kpurple,
      foregroundColor: foregroundColor ?? kwhite,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
         arrowBackIos,
          size: 20,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),

      title: Text(
        title,
        style: heading2.copyWith(
            color: titleColor ?? kwhite,
            height: getHeight(20.68) / getHeight(18)),
      ),
      actions: [

        trailing ?? const Text('',style: TextStyle(fontSize: 0),),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? getHeight(70));
}
