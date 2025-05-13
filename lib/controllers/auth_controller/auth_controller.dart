import 'package:express_ease/data/network/repositry/auth_repo.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/data/modals/response_modal.dart';
import 'package:express_ease/data/modals/signin_modal.dart';
import 'package:express_ease/data/modals/signup_model.dart';
import 'package:express_ease/res/chek_internet.dart/chek_internet.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/utils/custom_progress_indicator/cutom_progress_indicator.dart';
import 'package:express_ease/utils/cutom_toast/custom_toast.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  LoginModel? loginModel;

  final checkInternet = CheckInternet();

  bool? hasInternet;
  final StorageService _storageService = StorageService.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailForgotPasswordController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController confirmSetPasswordController = TextEditingController();

  TextEditingController otp = TextEditingController();

  RxInt selectedIndex = 0.obs;

  void nextIndex(index) {
    selectedIndex.value = index;
  }

  RxBool isObsecreLogin = true.obs;

  RxBool isObsecreSignup = true.obs;

  RxBool isObsecreLoginSignupConfirm = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final GlobalKey<FormState> forgotPasswordKey = GlobalKey();
  final GlobalKey<FormState> resetPasswordKey = GlobalKey();
  final GlobalKey<FormState> otpKey = GlobalKey();

  //save user in local storag
  void _saveUser() {
    _storageService.userId = loginModel!.userId!;
    _storageService.accessToken = loginModel!.accessToken!;
    _storageService.email = loginModel!.email!;
    _storageService.firstName = loginModel!.firstName!;
    _storageService.lastName = loginModel!.lastName!;
  }

//login user
  void signIn() async {
    if (formKey.currentState!.validate()) {
      CustomProgressIndicator.show();
      print('internt${await checkInternet.hasInternet()}');
      //cheking internrt
      if (!await checkInternet.hasInternet()) {
        Future.delayed(const Duration(milliseconds: 100), () {
          CustomProgressIndicator.hide();
        });
        return;
      }
      try {
        // login Api Call
        final response = await _authRepo.signinRepo(
          email: emailController.text,
          password: passwordController.text,
          dvToken: "123456632356",
        );
        // Close the loading dialog
        CustomProgressIndicator.hide();

        if (response.statusCode == 200) {
          ResponseModel<LoginModel> model =
              ResponseModel.fromJson(response.body, LoginModel.fromJson);

          if (model.responseCode == '1') {
            loginModel = model.response![0];
            //call save user to store user data in local storage
            _storageService.clearAll;
            _saveUser();
            print('access token is here${_storageService.getAccessToken}');
            CustomToast.showSuccess('Login', 'Login Successfully');
            Get.offAllNamed(RouteNames.homeScreen);
          } else {
            CustomToast.showError(
              'Login Failed',
              model.responseMessage ?? '',
            );
          }
        }
      } catch (e) {
        print("Error: $e");

        CustomToast.showError('Error', e.toString());
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
//sign up new user
  void signup() async {
    if (!signupFormKey.currentState!.validate()) {
      return;
    }

    final passwordError = Validation().confirmPassword(
      newPasswordController.text,
      confirmPasswordController.text,
    );

    if (passwordError != null) {
      Get.snackbar(
        "Password Error",
        passwordError,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    CustomProgressIndicator.show();
    //cheking internet
    if (!await checkInternet.hasInternet()) {
      Future.delayed(const Duration(milliseconds: 100), () {
        CustomProgressIndicator.hide();
      });
      return;
    }

    try {
      final response = await _authRepo.signUpRepo(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailSignupController.text,
        countryCode: '92',
        phoneNumber: phoneController.text,
        password: newPasswordController.text,
        dvToken: "123456632356",
      );

      CustomProgressIndicator.hide();
      if (response.statusCode == 200) {
        ResponseModel<SignupModel> model =
            ResponseModel.fromJson(response.body, SignupModel.fromJson);
        print(model.responseCode);
        if (model.responseCode == "1") {
          Get.snackbar(
            "Signup",
            model.responseMessage ?? '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          Get.toNamed(RouteNames.otpScreen);
        } else {
          Get.snackbar(
            "Signup Failed",
            model.errors ?? '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void forgotPassword() async {
    if (forgotPasswordKey.currentState!.validate()) {
      CustomProgressIndicator.show();
      //cheking internet
      if (!await checkInternet.hasInternet()) {
        Future.delayed(const Duration(milliseconds: 100), () {
          CustomProgressIndicator.hide();
        });
        return;
      }
      try {
        final response = await _authRepo.forgotPasswordRepo(
            email: emailForgotPasswordController.text);

        CustomProgressIndicator.hide();
        if (response.statusCode == 200) {
          if (response.body['ResponseCode'] == "1") {
            final data = response.body["Response"][0];
            print(data["userId"]);
            print(data['forgetRequestId']);

            _storageService.forgetUserId = data["userId"];

            _storageService.forgetRequestId = data['forgetRequestId'];

            print(_storageService.getForgetRequestId);
            print(_storageService.getForgetUserId);
            Get.snackbar(
              "Verify Email",
              response.body['ResponseMessage'] ?? '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: klightGreen,
              colorText: Colors.white,
            );
            Get.toNamed(RouteNames.otpScreen);
          } else {
            Get.snackbar(
              "Not Found",
              response.body['errors'] ?? '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }
      } catch (e) {
        print("Error: $e");

        CustomToast.showError('Error', e.toString());
      }
    }
  }

  void changePassword() async {
    print(otp);

    if (resetPasswordKey.currentState!.validate() &&
        setPasswordController.text == confirmSetPasswordController.text &&
        otp.text.length == 4) {
      print(setPasswordController.text.length);
      print(confirmSetPasswordController.text.length);
      CustomProgressIndicator.show();
      //cheking internet
      if (!await checkInternet.hasInternet()) {
        Future.delayed(const Duration(milliseconds: 100), () {
          CustomProgressIndicator.hide();
        });
        return;
      }
      final response = await _authRepo.changePasswordRepo(
          userId: _storageService.getForgetUserId!,
          forgetRequestID: _storageService.getForgetRequestId!,
          newPassword: setPasswordController.text,
          otp: otp.text);

      CustomProgressIndicator.hide();
      if (response.statusCode == 200) {
        setPasswordController.clear();
        confirmSetPasswordController.clear();
        otp.clear();

        final data = response.body;

        if (data['ResponseCode'] == '1') {
          CustomToast.showSuccess('Password Change',
              data['ResponseMessage'] ?? 'PasswordChanged Successfully');
          Get.toNamed(RouteNames.loginScreen);
        } else {
          CustomToast.showError(
            'Login Failed',
            data['ResponseMessage'] ?? 'Otp Expires',
          );
        }
      }
    } else {
      CustomToast.showWarning('Password Change', 'chek Password And otp');
    }
  }

//logout user
  void logoutUser() async {
    CustomProgressIndicator.show();

    ///cheking for internet connectivity
    if (!await checkInternet.hasInternet()) {
      Future.delayed(const Duration(milliseconds: 100), () {
        CustomProgressIndicator.hide();
      });
      return;
    }
    try {
      /////Api call
      final response = await _authRepo.logoutRepo();
      CustomProgressIndicator.hide();
      if (response.statusCode == 200) {
        _storageService.clearAll();

        print('after deleting first name is ${_storageService.getFirstName}');
        print('after deleting first name is ${_storageService.getAccessToken}');
        Get.offAllNamed(RouteNames.loginScreen);
      }
    } catch (e) {
      print(e);
    }
  }

  void chekSession() {
    print(_storageService.getAccessToken);
    if (_storageService.getAccessToken != null) {
      Get.offAllNamed(RouteNames.homeScreen);
    } else {
      Get.offAllNamed(RouteNames.wellComeScreen);
    }
  }
}
