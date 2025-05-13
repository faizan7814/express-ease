import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_outlined_doted.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/ui/home/parcel_details/add_address_screen.dart';
import 'package:express_ease/ui/profile/saved_address_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupDetaile extends StatelessWidget {
  PickupDetaile({super.key});

  final controller = Get.find<BookingParcelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Pickup Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 27)),
              Text(
                'PICKUP DETAILS',
                style: title1NullShok.copyWith(color: kblackLow),
              ),
              SizedBox(
                height: getHeight(25),
              ),
              Text(
                'Pickup Address',
                style: inputText1.copyWith(color: kpurple),
              ),
              SizedBox(
                height: getHeight(10),
              ),

              SizedBox(
                height: getHeight(140),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.userAddresses.isNotEmpty
                        ? controller.userAddresses.length
                        : 5,
                    itemBuilder: (context, int index) {
                      return  Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: GestureDetector(
                                onTap: () {
                                  controller.togglePickupAddress(index);
                                },
                                child: Obx(
                                  () => SavedAddressItem(
                                      width: getWidth(250),
                                      height: getHeight(140),
                                      isSelected: controller
                                              .pickupAddressSelectedIndex
                                              .value ==
                                          index,
                                      // userAddress:
                                      //     controller.userAddresses[index]
                                      ),
                                ),
                              ),
                            );
                    }),
              ),

              // Text(
              //   'You have no saved addresses yet',
              //   style: inputText5.copyWith(color: kblackOpacity),
              // ),
              SizedBox(
                height: getHeight(31),
              ),
              MyOutlinedButtonDotedBorder(
                  text: 'Add New Address',
                  onPressed: () {
                    Get.to(AddAddress(
                      title: 'Pickup Address',
                    ));
                  }),
              const Spacer(),
              CustomButton(
                  text: 'Submmit & Continue',
                  onPressed: () {
                   // controller.getpickupAddress();
                    Get.toNamed(RouteNames.receiverDetails);
                  }),
              const Padding(padding: EdgeInsets.only(bottom: 50))
            ],
          ),
        ),
      ),
    );
  }
}
