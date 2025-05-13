import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/my_input_field_phone.dart';
import 'package:express_ease/res/validations/validation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_outlined_button.dart';
import 'package:express_ease/my_widgets/password_feild.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: kmainPadding,
            ),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: getHeight(42)),
                  Text(
                    'Signup with Antrak',
                    style: heading2.copyWith(color: kpurple),
                  ),
                  SizedBox(height: getHeight(28)),
                  Row(
                    children: [
                      Expanded(
                          child: MyInputField(
                        textController: controller.firstNameController,
                        title: 'First Name',
                        hint: 'Ahsan',
                        validate: Validation().validateField,
                      )),
                      SizedBox(width: getWidth(14)),
                      Expanded(
                          child: MyInputField(
                        textController: controller.lastNameController,
                        validate: Validation().validateField,
                        title: 'Last Name',
                        hint: 'Jutt',
                      )),
                    ],
                  ),
                  SizedBox(height: getHeight(15)),
                  MyInputField(
                      textController: controller.emailSignupController,
                      title: 'Email',
                      hint: 'ahsan@gmail.com',
                      validate: Validation().validateEmail),
                  SizedBox(height: getHeight(15)),

                  MyInputFieldPhone(
                    validate: Validation().validatePhone,
                    title: 'Phone',
                    hint: 'XXX XXX XXX',
                    textController: controller.phoneController,
                  ),

                  SizedBox(height: getHeight(12)),

                  Obx(
                    () => PasswordInputField(
                      textController: controller.newPasswordController,
                      onObsecure: controller.isObsecreSignup.toggle,
                      isObsecre: controller.isObsecreSignup.value,
                      validate: Validation().validatePassword,
                      title: 'Password',
                      hint: 'Enter your password',
                    ),
                  ),
                  SizedBox(height: getHeight(12)),
                  Obx(() => PasswordInputField(
                      onObsecure: controller.isObsecreLoginSignupConfirm.toggle,
                      isObsecre: controller.isObsecreLoginSignupConfirm.value,
                      validate: (value) {
                        if (value == controller.newPasswordController.text) {
                          return null;
                        }
                        return 'Password not matched';
                      },
                      textController: controller.confirmPasswordController,
                      title: 'Confirm password',
                      hint: 'Enter your password',
                      errorText: Validation().confirmPassword(
                          controller.newPasswordController.text,
                          controller.confirmPasswordController.text))),

                  SizedBox(height: getHeight(20)),
                  CustomButton(
                    text: 'Create New Acount',
                    onPressed: () {
                      controller.signup();
                    },
                  ),
                  SizedBox(height: getHeight(15)),
                  Center(
                    child: Text(
                      'or',
                      style: inputText1.copyWith(color: kblackOpacity),
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  MyOutlinedButton(
                    onPressed: () {},
                    titelText: 'Continue with Google',
                    iconPadding: EdgeInsets.only(
                        right: getWidth(24), left: getWidth(35)),
                    titleColor: kpurple,
                    roundedBorder: 5,
                    height: getHeight(48),
                    icon: Image.asset('assets/images/google-logo.png'),
                    sideColor: kpurple,
                  ),
                  SizedBox(height: getHeight(48)),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account, ',
                      style: heading5.copyWith(color: kblack, wordSpacing: 0.3),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed('/loginScreen');
                            },
                          text: 'Login',
                          style: heading4.copyWith(
                            fontSize: getFont(15),
                            color: kpurple,
                            wordSpacing: 0.3,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' now',
                          style: heading5.copyWith(color: kblack),
                        ),
                      ],
                    ),
                  ), // Bottom Padding
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
