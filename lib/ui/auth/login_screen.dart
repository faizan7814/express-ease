import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_outlined_button.dart';
import 'package:express_ease/my_widgets/password_feild.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.find<AuthController>();
  final Validation validation = Validation();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kmainPadding,
            ),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 66)),
                   Image.asset(logo2,height: getHeight(101),width: getWidth(251),),
                  SizedBox(
                    height: getHeight(42),
                  ),
                  Text(
                    'Login',
                    style: heading2.copyWith(color: kpurple),
                  ),
                  SizedBox(
                    height: getHeight(9),
                  ),
                  Text(
                    'Sign in to continue!',
                    style: inputText4.copyWith(color: kgrey),
                  ),
                  SizedBox(
                    height: getHeight(46),
                  ),
                  MyInputField(
                    validate: validation.validateEmail,
                    textController: controller.emailController,
                    title: 'Email',
                    hint: 'ahmad@gmail.com',
                  ),
                  SizedBox(
                    height: getHeight(12),
                  ),
                  Obx(()=>
                     PasswordInputField(
                      textController: controller.passwordController,
                      title: 'Password',
                      hint: '********',
                      validate: Validation().validatePassword,
                      isObsecre: controller.isObsecreLogin.value,
                      onObsecure: controller.isObsecreLogin.toggle,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed('/forgotPasswordScreen');
                          },
                          child: Text(
                            'forgot password?',
                            style: inputText5.copyWith(
                                decoration: TextDecoration.underline,
                                color: kpurple),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(112),
                  ),
                  CustomButton(
                      height: getHeight(48),
                      text: 'Login',
                      onPressed: () async {
                        Get.offAllNamed(RouteNames.homeScreen);
                      // controller.signIn();
                      }),
                   SizedBox(height: getHeight(15)),
                  Center(
                    child: Text(
                      'or',
                      style: inputText1.copyWith(color: kblackOpacity),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  MyOutlinedButton(
                    height: getHeight(48),
                    iconPadding: EdgeInsets.only(
                        right: getWidth(24), left: getWidth(35)),
                    onPressed: () {},
                    titelText: 'Continue with Google',
                    titleColor: kpurple,
                    roundedBorder: 5,
                    icon: Image.asset('assets/images/google-logo.png'),
                    sideColor: kpurple,
                  ),
                  SizedBox(height: getHeight(48)),
                  RichText(
                    text: TextSpan(
                        text: 'Don’t have an account ',
                        style: heading5.copyWith(
                          color: kblack,
                          wordSpacing: .3,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed('/signupScreen');
                              },
                            text: 'Sign up',
                            style: heading4.copyWith(
                                fontSize: getFont(15),
                                color: kpurple,
                                wordSpacing: .3,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: ' now',
                            style: heading5.copyWith(color: kblack),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
