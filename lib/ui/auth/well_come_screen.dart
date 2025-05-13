import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:flutter/gestures.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:express_ease/my_widgets/my_outlined_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: .4),
                BlendMode.darken,
              ),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              image: const AssetImage(bachGroundImage)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(294),
              ),
              Text(
                'WellCome!',
                style: title2.copyWith(color: kwhite),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Text(
                'Welcome to Antrak. Get your parcel delivered with us more faster',
                style: inputText4.copyWith(
                  color: kwhite,
                  height: 1.5,
                  letterSpacing: .5,
                ),
              ),
              SizedBox(
                height: getHeight(48),
              ),
              CustomButton(
                  height: getHeight(48),
                  roundCorner: 5,
                  borderColor: kwhite,
                  color: kwhite,
                  text: 'Create New Acount',
                  textColor: kpurple,
                  onPressed: () {
                    Get.offNamed(RouteNames.signupScreen);
                  }),
              SizedBox(
                height: getHeight(24),
              ),
              MyOutlinedButton(
                  height: getHeight(48),
                  width: double.infinity,
                  sideColor: kwhite,
                  roundedBorder: 5,
                  titelText: 'Login into Existing Acount',
                  titleColor: kwhite,
                  onPressed: () {
                    Get.offNamed(RouteNames.loginScreen);
                  }),
              SizedBox(
                height: getHeight(52),
              ),
              Center(
                child: Text(
                  'or',
                  style: inputText1.copyWith(color: kwhiteOpacity),
                ),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              MyOutlinedButton(
                onPressed: () {},
                titelText: 'Continue with Google',
                 iconPadding: EdgeInsets.only(
                        right: getWidth(24), left: getWidth(35)),
                titleColor: kwhite,
                roundedBorder: 5,
                height: getHeight(48),
                icon: Image.asset('assets/images/google-logo.png'),
                sideColor: kwhite,
              ),
              SizedBox(
                height: getHeight(74),
              ),
              RichText(
                
                text: TextSpan(
                    text:
                        'By clicking Signup, Login or Continue with Google, you\nagree to our ',
                    style: heading5.copyWith(
                      fontSize: 12,
                      color: kwhite,
                      wordSpacing: .3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: heading5.copyWith(
                          fontSize: 12,
                            color: korange,
                            wordSpacing: .3,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: heading5.copyWith(fontSize: 12,color: kwhite),
                      ),
                      TextSpan(
                        text: 'Privacy Statement',
                        style: heading5.copyWith(
                          fontSize: 12,
                            color: korange,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: '.',
                        style: heading5.copyWith(color: kwhite),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
