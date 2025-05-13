import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_chek_box.dart';
import 'package:express_ease/my_widgets/my_outlined_button.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:express_ease/res/permisssion_handler/communication_helper.dart';

class TrackParcelScreen extends StatelessWidget {
  TrackParcelScreen({super.key});

  final communicationHelper = CommunicationHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Parcel Status'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
              top: getHeight(20),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Status',
                  style: heading2.copyWith(color: kblack),
                ),
                Text('Order#33867853',
                    style: inputText3.copyWith(
                      color: kblackOpacity,
                    )),
              ],
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order in progress',
                  style: paragraph.copyWith(color: korange),
                ),
                Container(
                  height: getHeight(44),
                  width: getWidth(150),
                  decoration: BoxDecoration(
                    color: klightGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(16), vertical: getHeight(8)),
                        child: Image.asset(
                          tridot,
                          height: getHeight(17),
                          width: getWidth(15),
                          color: korange,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Security Code',
                            style: inputText6.copyWith(color: kblack),
                          ),
                          SizedBox(
                            height: getHeight(8),
                          ),
                          Text(
                            '1xs43f5ybb3c89',
                            style: inputText5.copyWith(color: kblackOpacity),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                height: getHeight(
              14,
            )),
            Text(
              'Street 3, G1 Johar Town Lahore\nCity, Punjab',
              style: inputText3.copyWith(color: kpurple),
            ),
            SizedBox(
                height: getHeight(
              20,
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        const MyCheckBox(
                          completed: true,
                        ),
                        Container(
                          height: 38,
                          width: 2,
                          color: kblackOpacity,
                        ),
                        const MyCheckBox(
                          onGoing: true,
                        ),
                        Container(
                          height: 38,
                          width: 2,
                          color: kblackOpacity,
                        ),
                        const MyCheckBox(
                          onGoing: false,
                        ),
                        Container(
                          height: 38,
                          width: 2,
                          color: kblackOpacity,
                        ),
                        const MyCheckBox(),
                        Container(
                          height: 38,
                          width: 2,
                          color: kblackOpacity,
                        ),
                        const MyCheckBox()
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Request accepted',
                        style: paragraph.copyWith(color: kblack),
                      ),
                      Text(
                        '14 Feb, 2023  09:00 am',
                        style: inputText5.copyWith(color: kblackLow),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Text(
                        'On the way',
                        style: paragraph.copyWith(color: kblack),
                      ),
                      Text(
                        '14 Feb, 2023  09:00 am',
                        style: inputText5.copyWith(color: kblackLow),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Text(
                        'Picked up',
                        style: paragraph.copyWith(color: kblack),
                      ),
                      Text(
                        '14 Feb, 2023  09:00 am',
                        style: inputText5.copyWith(color: kblackLow),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Text(
                        'Out for delivery',
                        style: paragraph.copyWith(color: kblack),
                      ),
                      Text(
                        '14 Feb, 2023  09:00 am',
                        style: inputText5.copyWith(color: kblackLow),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Text(
                        'Delivered',
                        style: paragraph.copyWith(color: kblack),
                      ),
                      Text(
                        '14 Feb, 2023  09:00 am',
                        style: inputText5.copyWith(color: kblackLow),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                height: getHeight(
              12,
            )),
            Text(
              'Street 3, G1 Johar Town Lahore\nCity, Punjab',
              style: inputText3.copyWith(color: kpurple),
            ),
            SizedBox(
                height: getHeight(
              60,
            )),
            CustomButton(
                text: 'Track on map',
                onPressed: () {
                  Get.toNamed(RouteNames.trackonMapscreen);
                }),
            SizedBox(
                height: getHeight(
              22,
            )),
            Row(
              children: [
                Expanded(
                    child: MyOutlinedButton(
                  titleColor: kpurple,
                  onPressed: () {
                    communicationHelper.sendSms('12423412344');
                  },
                  titelText: 'Chat',
                  iconPadding: const EdgeInsets.only(right: 8, left: 15),
                  icon: Image.asset(
                    message,
                    height: 20,
                    width: 20,
                  ),
                )),
                SizedBox(
                  width: getWidth(15),
                ),
                Expanded(
                    child: MyOutlinedButton(
                  titleColor: kpurple,
                  onPressed: () async {
                    await communicationHelper.makePhoneCall('77823782378');
                  },
                  titelText: 'Call',
                  icon: Image.asset(
                    call,
                    height: 21,
                    width: 17,
                  ),
                  iconPadding: const EdgeInsets.only(right: 8, left: 15),
                )),
              ],
            ),
            SizedBox(
              height: getHeight(15),
            ),
            
          ],
        ),
      ),
    );
  }
}
