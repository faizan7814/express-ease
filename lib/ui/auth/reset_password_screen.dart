import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';

import 'package:express_ease/my_widgets/password_feild.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 219),
          child: Form(
            key: controller.resetPasswordKey,
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: heading2.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(38),
                ),
                PasswordInputField(
                    showIcon: false,
                    textController: controller.setPasswordController,
                    hint: 'Enter new passpord'),
                SizedBox(
                  height: getHeight(20),
                ),
                PasswordInputField(
                    showIcon: false,
                    errorText: Validation().confirmPassword(
                        controller.confirmSetPasswordController.text,
                        controller.setPasswordController.text),
                    textController: controller.confirmSetPasswordController,
                    hint: 'Confirm new passWord'),
                SizedBox(
                  height: getHeight(38),
                ),
                CustomButton(
                    text: 'Continue',
                    onPressed: () {
                      controller.changePassword();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
