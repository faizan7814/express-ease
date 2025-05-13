import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
//import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/custom_dialog/custom_dialog_box.dart';
import 'package:express_ease/ui/profile/profile_screen/profile_container.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

 // final _storageService = StorageService.instance;
  final controller = Get.find<AuthController>();
  final controller1 = Get.find<BookingParcelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(50),
          ),
          Center(
              child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    profile,
                    height: getHeight(100),
                    width: getWidth(100),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Text(
                'name',
               // '${_storageService.getFirstName!.toUpperCase()} ${_storageService.getLastName!.toUpperCase()}',
                style: inputText1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kpurple,
                    fontSize: getFont(20)),
              ),
            ],
          )),
          SizedBox(
            height: getHeight(49),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.cardsScreen);
            },
            child: ProfileContainer(
              icon: Image.asset(
                card,
                height: getHeight(15),
                width: getWidth(21),
              ),
              title: 'My Cards',
            ),
          ),
          SizedBox(
            height: getHeight(40),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.savedAddressesScreen);
              controller1.getAddresses();
            },
            child: ProfileContainer(
              icon: Image.asset(
                loction,
                height: getHeight(20),
                width: getWidth(26),
              ),
              title: 'Saved Addresses',
            ),
          ),
          SizedBox(
            height: getHeight(40),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.editProfile);
            },
            child: ProfileContainer(
              icon: Image.asset(
                person,
                height: getHeight(14),
                width: getWidth(16),
              ),
              title: 'Edit Profile',
            ),
          ),
          SizedBox(
            height: getHeight(40),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.changePasswordScreen);
            },
            child: ProfileContainer(
              icon: Image.asset(
                lock,
                height: getHeight(15.5),
                width: getWidth(18.5),
              ),
              title: 'Change Password',
            ),
          ),
          SizedBox(
            height: getHeight(40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Help & Support',
                  style: heading6.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  'Privacy Policy',
                  style: heading6.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  'Terms & Condition',
                  style: heading6.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                InkWell(
                  onTap: () => showCustomDialog(
                      onConfirm: controller.logoutUser,
                      title: 'Logout',
                      message: "Are you sure you want to logout"),
                  child: Text(
                    'Logout',
                    style: heading6.copyWith(color: kpurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
