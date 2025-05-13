import 'package:express_ease/data/modals/edit_profile_model.dart';
import 'package:express_ease/data/modals/response_modal.dart';
import 'package:express_ease/data/network/repositry/profile_repo.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';

import 'package:express_ease/utils/custom_progress_indicator/cutom_progress_indicator.dart';
import 'package:express_ease/utils/cutom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final ProfileRepo _profileRepo = Get.find<ProfileRepo>();
  final StorageService _storageServices = StorageService.instance;

  EditProfileModel? editProfileModel;

  RxBool readOnly = true.obs;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> changePasswordFormkey = GlobalKey();
  final GlobalKey<FormState> editProfileFormKey = GlobalKey();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  Rx<DateTime> fromSelectedDate =
      DateTime.now().subtract(const Duration(days: 30)).obs;
  Rx<DateTime> toSelectedDate = DateTime.now().obs;

  final DateFormat formatter = DateFormat.yMd();

  Future<void> selectDate(
      BuildContext context, Rx<DateTime?> targetDate) async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: targetDate.value ?? now,
      firstDate: now.subtract(const Duration(days: 30)),
      lastDate: now,
    );

    if (pickedDate != null) {
      targetDate.value = formatter.format(pickedDate) as DateTime;
    }
  }

  String getFormattedDate(Rx<DateTime> date) {
    return formatter.format(date.value);
  }

  void clearChangePasswordFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  void clearEditProfileFeilds() {
    firstName.clear();
    lastName.clear();
    phoneNo.clear();
    countryCode.clear();
  }

  void updateUser() {
    _storageServices.deleteFirstName();
    _storageServices.deleteLastName();
    _storageServices.deletePhoneNo();
    _storageServices.deleteCountryCode();
    _storageServices.firstName = editProfileModel!.firstName!;
    _storageServices.lastName = editProfileModel!.lastName!;
    _storageServices.phoneNo = editProfileModel!.phoneNum!;
    _storageServices.countryCode = editProfileModel!.countryCode!;
  }

  void changePasswordProfile() async {
    if (changePasswordFormkey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
        print('validation done');
        CustomProgressIndicator.show();
        try {
          final response = await _profileRepo.changePasswordRepo(
              oldPassword: oldPasswordController.text,
              newPasssword: newPasswordController.text);

          CustomProgressIndicator.hide();

          if (response.statusCode == 200) {
            print('run status code');
            final responseModel = response.body;

            print('run model');
            if (responseModel['ResponseCode'] == '1') {
              clearChangePasswordFields();
              Get.back();
              CustomToast.showSuccess(
                  'Password changed',
                  responseModel['ResponseMessage'] ??
                      'Password changed Successfully');
            }

            if (responseModel['ResponseCode'] == '0') {
              CustomToast.showSuccess('Password not changed',
                  responseModel['ResponseMessage'] ?? 'Password not changed');
            }
          }
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void updateprofile() async {
    if (editProfileFormKey.currentState!.validate()) {
      print(' phone and contry code${phoneNo.text} ${countryCode.text}');

      CustomProgressIndicator.show();
      final response = await _profileRepo.editProfileRepo(
          firstName: firstName.text,
          lastName: lastName.text,
          phoneNo: phoneNo.text,
          countryCode: '${countryCode.text}-');
      CustomProgressIndicator.hide();
      if (response.statusCode == 200) {
        ResponseModel responseModel =
            ResponseModel.fromJson(response.body, EditProfileModel.fromJson);

        if (responseModel.responseCode == '1') {
          editProfileModel = responseModel.response![0];

          clearEditProfileFeilds();
          updateUser();
          readOnly.toggle();
        }
      }
    }
  }
}
