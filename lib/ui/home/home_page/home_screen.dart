import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/ui/home/home_page/landing_screen.dart';
import 'package:express_ease/ui/order_history/order_history.dart';
import 'package:express_ease/ui/profile/profile_screen/profile_screen.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<BookingParcelController>();

  final List<Widget> screens = [
    OrderHistory(),
    ProfileScreen(),
    LandingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: getHeight(77),
        width: getWidth(77),
        child: FloatingActionButton(
          backgroundColor: kwhite,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(42)),
          onPressed: () {
            controller.onSelect(2);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                profileScreenImage,
                height: getHeight(20),
                width: getWidth(20),
              ),
              SizedBox(
                height: getHeight(4),
              ),
              Text(
                'Delivery',
                style: inputText6.copyWith(color: kpurple),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return screens[controller.selectedPageIndex.value];
      }),
      bottomNavigationBar: BottomAppBar(
        color: kpurple,
        shape: const CircularNotchedRectangle(),
        height: getHeight(80),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.onSelect(0);
                },
                child: Container(
                  color: kpurple,
                  child: Column(
                    children: [
                      Image.asset(homePageHistory,
                          height: getHeight(20), width: getWidth(16)),
                      SizedBox(
                        height: getHeight(8),
                      ),
                      Obx(() {
                        return Text('Order History',
                            style: controller.selectedPageIndex.value == 0
                                ? inputText6.copyWith(
                                    color: kwhite,
                                    fontSize: getFont(12),
                                  )
                                : inputText6.copyWith(
                                    color: kwhiteOpacity,
                                    fontSize: getFont(12),
                                  ));
                      }),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.onSelect(1);
                },
                child: Container(
                  color: kpurple,
                  child: Column(
                    children: [
                      Image.asset(homePageMenu,
                          height: getHeight(20), width: getWidth(16)),
                      SizedBox(
                        height: getHeight(8),
                      ),
                      Obx(() {
                        return Text('Profile',
                            style: controller.selectedPageIndex.value == 1
                                ? inputText6.copyWith(
                                    color: kwhite, fontSize: getFont(12))
                                : inputText6.copyWith(
                                    color: kwhiteOpacity,
                                    fontSize: getFont(12),
                                  ));
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
