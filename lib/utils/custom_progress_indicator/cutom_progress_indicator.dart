import 'package:express_ease/res/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeWidth;

  const CustomProgressIndicator({
    super.key,
    this.primaryColor = korange,
    this.secondaryColor = kpurpleOpacity,
    this.strokeWidth = 4.0,
  });

  static void show(
      {Color primaryColor = korange,
      Color secondaryColor = kpurpleOpacity,
      double strokeWidth = 4.0}) {
    Get.dialog(
      CustomProgressIndicator(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        strokeWidth: strokeWidth,
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
        backgroundColor: secondaryColor,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
