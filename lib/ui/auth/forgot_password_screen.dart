import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 219),
          child: Form(
            key: controller.forgotPasswordKey,
            child: Column(
              children: [
                Text(
                  'Forgot Password',
                  style: heading2.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(26),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Enter your email address. A Reset link will be sent\nto your registered email',
                  style: heading5.copyWith(color: kblack),
                ),
                SizedBox(
                  height: getHeight(34),
                ),
                MyInputField(
                    textController: controller.emailForgotPasswordController,
                    validate: Validation().validateEmail,
                    hint: 'example@gmail.com'),
                SizedBox(
                  height: getHeight(58),
                ),
                CustomButton(
                    height: 40,
                    text: 'Continue',
                    onPressed: () {
                      controller.forgotPassword();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
