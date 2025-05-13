import 'package:express_ease/res/colors/colors.dart';

import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  // Success Toast
  static void showSuccess(String title, String message) {
    Fluttertoast.showToast(
      msg: "$title\n$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: klightGreen,
      textColor: kwhite,
      fontSize: 16.0,
    );
  }

  // Error Toast
  static void showError(String title, String message) {
    Fluttertoast.showToast(
      msg: "$title\n$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: kerrorRed,
      textColor: kwhite,
      fontSize: 16.0,
    );
  }

  // Info Toast
  static void showInfo(String title, String message) {
    Fluttertoast.showToast(
      msg: "$title\n$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: kblue,
      textColor: kwhite,
      fontSize: 16.0,
    );
  }

  // Warning Toast
  static void showWarning(String title, String message) {
    Fluttertoast.showToast(
      msg: "$title\n$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: korangeOpacity,
      textColor: kwhite,
      fontSize: 16.0,
    );
  }
}
