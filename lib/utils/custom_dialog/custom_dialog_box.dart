import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:express_ease/res/colors/colors.dart';

void showCustomDialog({
  required String title,
  required String message,
  String confirmText = "OKAY",
  String cancelText = "Cancel",
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool showCancelButton = true,
}) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, color: kpurple),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: kblackOpacity),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showCancelButton)
              TextButton(
                onPressed: () {
                  Get.back();
                  if (onCancel != null) onCancel();
                },
                child:
                    Text(cancelText, style: const TextStyle(color: kerrorRed)),
              ),
            TextButton(
              onPressed: () {
                Get.back();
                if (onConfirm != null) onConfirm();
              },
              child: Text(confirmText,
                  style: const TextStyle(
                      color: kpurple, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
