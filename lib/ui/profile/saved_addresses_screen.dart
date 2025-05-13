import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/my_outlined_doted.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/ui/home/parcel_details/add_address_screen.dart';
import 'package:express_ease/utils/custom_dialog/custom_dialog_box.dart';
import 'package:express_ease/ui/profile/saved_address_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedAddressesScreen extends StatelessWidget {
  SavedAddressesScreen({super.key});

  final controller = Get.find<BookingParcelController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Saved Addresses',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: getHeight(41))),
              Text(
                'Saved Addresses',
                style: inputText1.copyWith(color: kpurple),
              ),
              SizedBox(
                height: getHeight(25),
              ),
              if (controller.userAddresses.isNotEmpty)
                SizedBox(
                  height: getHeight(441),
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.userAddresses.isEmpty
                            ? 5
                            : controller.userAddresses.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: getHeight(15)),
                            child: Obx(
                              () => SavedAddressItem(
                                  onDelete: () {
                                    print('deleted address index id $index');
                                    showCustomDialog(
                                        onConfirm: () {
                                          controller.deleteAddress(index);
                                        },
                                        title: 'Delete Address',
                                        message:
                                            'Are you sure you want to delete Address');
                                  },
                                  height: getHeight(160),
                                  showDltIcon: true,
                                  // userAddress: controller.userAddresses[index]
                                  ),
                            ),
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
                height: getHeight(68),
              ),
              MyOutlinedButtonDotedBorder(
                  text: 'Add New Address',
                  onPressed: () {
                    Get.to(AddAddress(title: 'Add Addresse'));
                    //     Get.to(
                    //    AddAddress(
                    //  title: 'Add New Address'));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
