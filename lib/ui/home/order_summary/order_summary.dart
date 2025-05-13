import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/res/colors/colors.dart';

import 'package:express_ease/ui/home/order_summary/order_summary_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  OrderSummary({this.showDeleteIcon = true, super.key});
  final bool? showDeleteIcon;

  final controller = Get.find<BookingParcelController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pickup Details',
          style: inputText1.copyWith(color: kpurple),
        ),
        SizedBox(
          height: getHeight(10),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address:',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Schedule:',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Notes:',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
              ],
            ),
            SizedBox(
              width: getWidth(33),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // '${controller.pickupAddress!.title}${controller.pickupAddress!.building}',
                  'hello',
                  style: inputText5.copyWith(color: kblack),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  // controller.pickupDate.text,
                  'any',
                  style: inputText5.copyWith(color: kblack),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Glass items, handle with care',
                  style: inputText5.copyWith(color: kblack),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: getHeight(20),
        ),
        Text(
          'Receiver Details',
          style: inputText1.copyWith(color: kpurple),
        ),
        SizedBox(
          height: getHeight(13),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address:',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Phone No :',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Notes:',
                  style: inputText5.copyWith(color: kblackOpacity),
                ),
              ],
            ),
            SizedBox(
              width: getWidth(33),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 // '${controller.pickupAddress!.title}${controller.pickupAddress!.building}',
                 'hello',
                  style: inputText5.copyWith(color: kblack),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  '090076801',
                  style: inputText5.copyWith(color: kblack),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  'Glass items, handle with care',
                  style: inputText5.copyWith(color: kblack),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: getHeight(20),
        ),
        Text(
          'Package Details',
          style: inputText1.copyWith(color: kpurple),
        ),
        SizedBox(
          height: getHeight(20),
        ),
        const OrderSummaryItem()
      ],
    );
  }
}
