import 'package:permission_handler/permission_handler.dart';

class PermissionService {

Future<bool> requestCallPermission() async {
  PermissionStatus status = await Permission.phone.request();

  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    
    return false;
  } else if (status.isPermanentlyDenied) {
    
    return false;
  }

  return false;
}


  Future<bool> requestSmsPermission() async {
    var status = await Permission.sms.request();
   if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    return false;
  } else if (status.isPermanentlyDenied) {
    return false;
  }

  return false;
}

  Future<bool> checkPermission(Permission permission) async {
    var status = await permission.status;
    return status.isGranted;
  }
}
