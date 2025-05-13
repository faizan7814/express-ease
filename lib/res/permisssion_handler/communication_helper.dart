import 'package:express_ease/res/permisssion_handler/permission_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:url_launcher/url_launcher.dart';

class CommunicationHelper {
  final  _permissionService = PermissionService();


Future<void> makePhoneCall(String phoneNumber) async {
  bool hasPermission = await _permissionService.requestCallPermission();
  
  if (hasPermission) {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    await launchUrl(phoneUri);
  } else {
    Get.closeAllSnackbars();  
    Get.snackbar(
      'Permission Denied',
      'Allow phone call permission\nto make a call.',
      mainButton: TextButton(
        onPressed: () async {
          await openAppSettings();
        },
        child:const Text('Open Settings'),
      ),
    );
  }
}


  Future<void> sendSms(String phoneNumber) async {
    bool hasPermission = await _permissionService.requestSmsPermission();
    if (hasPermission) {
      final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);

        await launchUrl(smsUri);
      } else {
         Get.closeAllSnackbars();  
    Get.snackbar(
      'Permission Denied',
      'Allow SMS permission to send SMS.',
      mainButton: TextButton(
        onPressed: () async {
          await openAppSettings();
        },
        child:const Text('Open Settings'),
      ),
    );

  }
  }
}