import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/otp_feild.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/routes/route_names.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:flutter/material.dart';

import 'package:express_ease/utils/size_config.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();
  OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
              child: Column(
                children: [
                  // Image at the top
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      logo2, // Add your image in the assets folder
                      height: getHeight(250),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title and description
                  Text(
                    'Verify OTP',
                    style: title1.copyWith(color: kpurple),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    'Enter the OTP sent to your registered\nEmail.',
                    style: inputText4.copyWith(color: kblackLow),
                  ),
                  SizedBox(height: getHeight(40)),
                  // PIN entry fields
                  OtpField(
                    onSubmitOtp: (value) {
                      controller.otp.text = value;
                    },
                  ),

                  SizedBox(height: getHeight(30)),

                  // Submit button
                  CustomButton(
                      text: 'Verify',
                      onPressed: () {
                        print(controller.otp.value);
                        if (controller.otp.text.length == 4) {

                          Get.toNamed(RouteNames.resetPasswordScreen);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
