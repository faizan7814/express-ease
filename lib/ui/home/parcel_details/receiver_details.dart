import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_input_field_phone.dart';
import 'package:express_ease/my_widgets/my_outlined_doted.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';

import 'package:express_ease/ui/home/parcel_details/add_address_screen.dart';
import 'package:express_ease/ui/profile/saved_address_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiverDetails extends StatelessWidget {
  const ReceiverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingParcelController>();

    return Scaffold(
      appBar: const MyAppBar(title: 'Receivers`Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Obx(
            () => Form(
              key: controller.receiverDetailsFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 22)),
                  Text(
                    'RECEIVER`s DETAILS',
                    style: title1NullShok.copyWith(color: kblackLow),
                  ),
                  SizedBox(
                    height: getHeight(17),
                  ),
                  Text(
                    'Receiver Address',
                    style: inputText1.copyWith(color: kpurple),
                  ),
                  SizedBox(
                    height: getHeight(8),
                  ),
                  if (controller.userAddresses.isNotEmpty)
                    SizedBox(
                      height: 122,
                      child: Obx(
                        () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.userAddresses.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: GestureDetector(
                                    onTap: () {
                                      controller.toggleReceiverAddress(index);
                                    },
                                    child: Obx(
                                      () => SavedAddressItem(
                                          width: getWidth(250),
                                          height: getHeight(140),
                                          isSelected: controller
                                                  .receiverAddressSelectedIndex
                                                  .value ==
                                              index,
                                          // userAddress:
                                          //     controller.userAddresses[index]
                                          ),
                                    )),
                              );
                            }),
                      ),
                    ),
                  if (controller.userAddresses.isEmpty)
                    Text(
                      'You have no saved addresses yet',
                      style: inputText5.copyWith(color: kblackOpacity),
                    ),
                  SizedBox(
                    height: getHeight(24),
                  ),
                  MyOutlinedButtonDotedBorder(
                      text: 'Add New Address',
                      onPressed: () {
                        Get.to(AddAddress(title: 'Receiver Address'));
                      }),
                  SizedBox(
                    height: getHeight(28),
                  ),
                  MyInputField(
                      title: 'Receiver`s Full Name',
                      tilteStyle: inputText1.copyWith(color: kpurple),
                      textController: controller.receiverFullName,
                      hint: 'Enter full name'),
                  SizedBox(
                    height: getHeight(23),
                  ),
                  MyInputField(
                      title: 'Receiver`s Email Address',
                      tilteStyle: inputText1.copyWith(color: kpurple),
                      textController: controller.receiverEmail,
                      hint: 'Enter email address'),
                  SizedBox(
                    height: getHeight(23),
                  ),
                  MyInputFieldPhone(
                    title: 'Receiver`r Alternate Phone',
                    titleStyle: inputText1.copyWith(color: kpurple),
                    textController: controller.receiverPhoneNo,
                    onCountryCodeChanged: (code) {
                      controller.countryCode.text = code;
                    },
                  ),
                  SizedBox(
                    height: getHeight(42),
                  ),
                  CustomButton(
                      text: 'Submmit & Continue',
                      onPressed: () {
                        Get.toNamed(RouteNames.otherDetails);
                        controller.getReceiverAddress();

                        controller.getVehicle();
                      }),
                  const Padding(padding: EdgeInsets.only(bottom: 35))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
