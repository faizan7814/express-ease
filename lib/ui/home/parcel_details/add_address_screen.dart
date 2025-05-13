import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_input_field_phone.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddAddress({required this.title, super.key});

  final String title;
  final controller = Get.find<BookingParcelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Form(
            key: controller.addAddressFormKey,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 25)),
                MyInputField(
                  textController: controller.searchAddress,
                  hint: 'Search Address',
                  prefixIcon: const Icon(Icons.search),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Container(
                  height: getHeight(260),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(mapImage), fit: BoxFit.fitWidth)),
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                MyInputField(
                  textController: controller.addressTitle,
                  hint: 'Address Title',
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                Row(
                  children: [
                    Expanded(
                        child: MyInputField(
                            textController: controller.building,
                            hint: 'Building/Apt.')),
                    SizedBox(
                      width: getWidth(14),
                    ),
                    Expanded(
                        child: MyInputField(
                            textController: controller.city, hint: 'City')),
                  ],
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                Row(
                  children: [
                    Expanded(
                        child: MyInputField(
                            textController: controller.state, hint: 'State')),
                    SizedBox(
                      width: getWidth(14),
                    ),
                    Expanded(
                        child: MyInputField(
                            textController: controller.zipCode,
                            hint: 'Zip code')),
                  ],
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                MyInputFieldPhone(
                    onCountryCodeChanged: (code) {
                      controller.countryCode.text = code;
                    },
                    textController: controller.phoneNo),
                SizedBox(
                  height: getHeight(20),
                ),
                CustomButton(
                    text: 'Submit',
                    onPressed: () async {
                      controller.addAddresse();
                    }),
                const Padding(padding: EdgeInsets.only(bottom: 35))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
