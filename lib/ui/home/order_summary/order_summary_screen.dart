import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/res/colors/colors.dart';

import 'package:express_ease/ui/home/order_summary/order_summary.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({super.key});

  final controller = Get.find<BookingParcelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Order Summary'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(25),
              ),
              Text(
                'Review your Parcel',
                style: heading2.copyWith(
                  color: kblack,
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              OrderSummary(),
              SizedBox(
                height: getHeight(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyInputField(
                      textController: TextEditingController(),
                      hint: 'Enter promo code...',
                    ),
                  ),
                  SizedBox(
                    width: getWidth(15),
                  ),
                  CustomButton(
                    borderColor: klightBlue,
                    height: getHeight(48),
                    width: getWidth(112),
                    color: klightBlue,
                    text: 'Apply',
                    textColor: kblack,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(4),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Load/Offload',
                    style: heading5.copyWith(color: kblackOpacity),
                  ),
                  Text('\$200',
                      style: heading5.copyWith(
                          color: kblack, fontSize: getFont(18))),
                ],
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    style: heading5.copyWith(color: kblackOpacity),
                  ),
                  Text(
                    '\$0.00',
                    style:
                        heading5.copyWith(color: kblack, fontSize: getFont(18)),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: inputText1.copyWith(color: kpurple),
                  ),
                  Text(
                    '\$200.00',
                    style: inputText1.copyWith(color: kpurple),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(26),
              ),
              CustomButton(
                  text: 'Proceed to Payment',
                  onPressed: () {
                    controller.bookParcel();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
