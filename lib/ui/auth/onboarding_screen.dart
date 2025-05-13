import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/indicators.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  final PageController pageController =
      PageController();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController, 
        itemCount: 3,
        onPageChanged: (index) {
          controller.selectedIndex.value = index; 
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: getHeight(406),
                child: Stack(
                  children: [
                    Obx(() {
                      return Positioned(
                        left: controller.selectedIndex.value == 0
                            ? 0.0
                            : controller.selectedIndex.value == 1
                                ? Get.width * .25
                                : Get.width * .5,
                        top: 0,
                        child: Container(
                          height: getHeight(285),
                          width: getWidth(207),
                          color: controller.selectedIndex.value == 0
                              ? kpurple
                              : controller.selectedIndex.value == 1
                                  ? klightBlue
                                  : kblue,
                        ),
                      );
                    }),
                    Positioned(
                      bottom: 0,
                      left: getWidth(100),
                      child: Obx(() {
                        return Container(
                          height: getHeight(285),
                          width: getWidth(214),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == 0
                                ? klightPink
                                : controller.selectedIndex.value == 1
                                    ? kpurple
                                    : klightPink,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(300),
                              topRight: Radius.circular(300),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              controller.selectedIndex.value == 0
                                  ? onBoarding1
                                  : controller.selectedIndex.value == 1
                                      ? onBoarding2
                                      : onBoarding3,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(90)),
              Obx(() {
                return Text(
                  strutStyle: const StrutStyle(height: .5),
                  controller.selectedIndex.value == 0
                      ? 'Instant Rates & Bookings'
                      : controller.selectedIndex.value == 1
                          ? 'Track Shipment'
                          : 'Save time and money',
                  style: heading2.copyWith(color: kblack),
                );
              }),
              SizedBox(height: getHeight(26)),
              Obx(() {
                return Text(
                  textAlign: TextAlign.center,
                  controller.selectedIndex.value == 0
                      ? 'Experience our superfast delivery for food\ndelivered on time'
                      : controller.selectedIndex.value == 1
                          ? 'Experience peace of mind while tracking\nour order in real time'
                          : 'Experience peace of mind while tracking\nyour order in real time',
                  style: heading5.copyWith(color: kwhiteOpacity),
                );
              }),
              SizedBox(height: getHeight(58)),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Indicators(active: controller.selectedIndex.value == 0),
                    Indicators(active: controller.selectedIndex.value == 1),
                    Indicators(active: controller.selectedIndex.value == 2),
                  ],
                );
              }),
              SizedBox(height: getHeight(64)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(() {
                  return CustomButton(
                    height: getHeight(48),
                    text: controller.selectedIndex.value == 2
                        ? 'Get Started'
                        : 'Next',
                    onPressed: () {
                      if (controller.selectedIndex.value == 2) {
                        Get.offAllNamed('/wellComeScreen');
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeInOut,
                        ); 
                      }
                    },
                  );
                }),
              ),
              SizedBox(height: getHeight(35)),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed('/wellComeScreen');
                      },
                      child: Text(
                        'Skip',
                        style: inputText2.copyWith(color: kgrey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  
  }
