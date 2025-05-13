import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
//import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/my_widgets/my_outlined_button.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/ui/home/send_parcel/bottom_sheet/date_picker_sheet.dart';
import 'package:express_ease/ui/map/map_controller.dart';
import 'package:express_ease/ui/parcel_status/track_parcel_card.dart';
import 'package:flutter/material.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
 // final _storageService = StorageService.instance;
  final controller = Get.find<BookingParcelController>();
  final mapController = Get.find<MapController>();
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 40, horizontal: kmainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 37)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print('tapped');
                    mapController.fetchAddress();
                  },
                  child: const Icon(
                    Icons.location_pin,
                    size: 30,
                    color: kpurple,
                  ),
                ),
                SizedBox(
                  width: getWidth(4),
                ),
                Obx(() {
                  return Text(
                    mapController.userCurentAddress.value,
                    style: heading7.copyWith(
                      fontSize: 14,
                      color: kblack,
                    ),
                  );
                })
              ],
            ),
            SizedBox(
              height: getHeight(25),
            ),
            Text(
              'name',
             // _storageService.getFirstName!.toUpperCase(),
              style: title1.copyWith(color: kpurple),
            ),
            SizedBox(
              height: getHeight(6),
            ),
            Text(
              'Get your parcel delivered in time it takes\nfor drive there',
              style: heading5.copyWith(color: kpurple),
            ),
            SizedBox(
              height: getHeight(23),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: klightBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: getHeight(166),
                  width: double.infinity,
                ),
                Positioned(
                  top: 24,
                  bottom: 31,
                  left: 27,
                  child: SizedBox(
                      height: getHeight(111),
                      width: getWidth(149),
                      child: Image.asset(onBoarding1)),
                ),
                Positioned(
                  bottom: 50,
                  top: 40,
                  right: 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Delivery Now',
                          style: heading6.copyWith(color: korange)),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Get your packages deliverd\nanytime,anywhere',
                        style: inputText7.copyWith(
                          color: kblack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text('What would you like to send?',
                style: inputText1.copyWith(color: kpurple)),
            const SizedBox(
              height: 16,
            ),
            MyOutlinedButton(
              titelText: 'Send my parcel',
              titleStyle: buttonText2.copyWith(color: kwhite),
              height: getHeight(71),
              icon: Image.asset(
                profileButtonIcon,
                height: getHeight(45),
                width: getWidth(41),
              ),
              iconPadding: EdgeInsets.only(
                right: getWidth(16),
              ),
              backgroundColor: kpurple,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: kwhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  constraints: BoxConstraints(maxHeight: getHeight(401)),
                  builder: (ctx) {
                    return DatePickerSheet(
                      onConfirm: () {
                        Get.back();
                        Get.toNamed(RouteNames.sendParcelScreen);
                        controller.getCategory();
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: getHeight(30),
            ),
            const TrackParcelCard(),
          ],
        ),
      ),
    );
  }
}
