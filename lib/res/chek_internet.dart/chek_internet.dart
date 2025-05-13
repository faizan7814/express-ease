import 'package:express_ease/utils/cutom_toast/custom_toast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternet {
  // Singleton instance
  static final CheckInternet _instance = CheckInternet._internal();
  factory CheckInternet() => _instance;
  CheckInternet._internal();

  /// Checks if the device has an active internet connection.
  Future<bool> hasInternet() async {
    try {
      bool isConnected = await InternetConnection().hasInternetAccess;
      if (!isConnected) {
        Get.closeAllSnackbars();
        CustomToast.showWarning('No Internet', 'Check device connectivity');
      }
      return isConnected;
    } catch (e) {
      CustomToast.showError('Error', 'Failed to check internet: $e');
      return false;
    }
  }
}
