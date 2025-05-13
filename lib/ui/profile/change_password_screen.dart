import 'package:express_ease/controllers/profile_controller/profile_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';

import 'package:express_ease/my_widgets/password_feild.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/validations/validation.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kmainPadding, vertical: getHeight(12)),
        child: Form(
          key: controller.changePasswordFormkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: getHeight(8))),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        arrowBackIos,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(79),
                ),
                Text(
                  'Change Password',
                  style: heading2.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(52),
                ),
                PasswordInputField(
                    showIcon: false,
                    textController: controller.oldPasswordController,
                    hint: 'Old Password'),
                SizedBox(
                  height: getHeight(26),
                ),
                PasswordInputField(
                    showIcon: false,
                    textController: controller.newPasswordController,
                    hint: 'New Password'),
                SizedBox(
                  height: getHeight(26),
                ),
                PasswordInputField(
                    showIcon: false,
                    errorText: Validation().confirmPassword(
                        controller.newPasswordController.text,
                        controller.confirmPasswordController.text),
                    textController: controller.confirmPasswordController,
                    hint: 'Confirm New Password'),
                SizedBox(
                  height: getHeight(38),
                ),
                CustomButton(
                    text: 'Save',
                    onPressed: () {
                      controller.changePasswordProfile();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
