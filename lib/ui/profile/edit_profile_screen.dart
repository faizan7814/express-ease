import 'package:express_ease/controllers/profile_controller/profile_controller.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_input_field_phone.dart';

import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(ProfileController());
  final StorageService _storageServices = StorageService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          trailing: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return controller.readOnly.value
                    ? InkWell(
                        onTap: () {
                          controller.readOnly.toggle();
                        },
                        child: Text(
                          'Edit',
                          style: paragraph.copyWith(color: kwhite),
                        ))
                    : const Text(
                        '',
                        style: TextStyle(fontSize: 0),
                      );
              })),
          title: 'Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Form(
            key: controller.editProfileFormKey,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                  top: getHeight(67),
                )),
                Obx(() {
                  return MyInputField(
                      title: 'Fist Name',
                      readOnly: controller.readOnly.value,
                      textController: controller.firstName,
                      hint: _storageServices.getFirstName!);
                }),
                SizedBox(
                  height: getHeight(26),
                ),
                Obx(() {
                  return MyInputField(
                      title: 'Last Name',
                      readOnly: controller.readOnly.value,
                      textController: controller.lastName,
                      hint: _storageServices.getLastName!);
                }),
                SizedBox(
                  height: getHeight(26),
                ),
                Obx(() {
                  return MyInputFieldPhone(
                      title: 'Email',
                      readOnly: controller.readOnly.value,
                      textController: controller.phoneNo,
                      onCountryCodeChanged: (code) {
                        controller.countryCode.text = code;
                      },
                      hint:
                          '${_storageServices.getCountryCode}${_storageServices.getPhoneNo}');
                }),
                SizedBox(
                  height: getHeight(79),
                ),
                Obx(() {
                  return !controller.readOnly.value
                      ? CustomButton(
                          text: 'Save',
                          onPressed: () {
                            controller.updateprofile();
                          },
                        )
                      : const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
