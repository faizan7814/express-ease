import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validation {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!GetUtils.isPhoneNumber(value)) {
      return 'Enter a valid phone number';
    } else if (value.length < 10 || value.length > 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? validateField(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? confirmPassword(String value, String password) {
    if (value == password) {
      return null;
    }
    return 'Password not matched';
  }

  String? validateOtp(value) {
    if (value == null || value.isEmpty || value.length != 4) {
      return 'Enter a valid OTp';
    }
    return null;
  }
}
