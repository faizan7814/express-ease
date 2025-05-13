import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/indicators.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TrackParcelCard extends StatelessWidget {
  const TrackParcelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(10), vertical: getHeight(10)),
      decoration: BoxDecoration(
        color: klightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      height: getHeight(166),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order#33667660',
                  style: inputText3.copyWith(
                    color: kblackOpacity,
                  )),
              CustomButton(
                titleStyle: inputText6.copyWith(color: kwhite),
                height: getHeight(26),
                width: getWidth(112),
                color: kpurple,
                text: 'View Status',
                onPressed: () {
                  Get.toNamed(RouteNames.trackParcelScreen);
                },
              ),
            ],
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order status',
                    style: paragraph.copyWith(color: korange),
                  ),
                  Text(
                    'Waiting for driver to pickup',
                    style: inputText5.copyWith(color: kblackOpacity),
                  ),
                ],
              ),
              // Container(
              //   height: getHeight(44),
              //   width: getWidth(150),
              //   decoration: BoxDecoration(
              //     color: kwhite,
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: getWidth(16), vertical: getHeight(6)),
              //         child: Image.asset(
              //           tridot,
              //           height: getHeight(17),
              //           width: getWidth(15),
              //           color: korange,
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Security Code',
              //             style: inputText6.copyWith(color: kblack),
              //           ),
              //           SizedBox(
              //             height: getHeight(6),
              //           ),
              //           Text(
              //             '1xs43f5ybb3c69',
              //             style: inputText5.copyWith(color: kblackOpacity),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Indicators(
                  height: getHeight(9),
                  activeWidth: getWidth(60),
                  unactiveWidth: getWidth(60),
                  activeColor: korange,
                  unActiveColor: korangeOpacity,
                  active: true),
              // SizedBox(
              //   width: getWidth(6),
              // ),
              Indicators(
                  height: getHeight(9),
                  activeWidth: getWidth(60),
                  unactiveWidth: getWidth(60),
                  activeColor: korange,
                  unActiveColor: korangeOpacity,
                  active: false),
              // SizedBox(
              //   width: getWidth(6),
              // ),
              Indicators(
                  height: getHeight(9),
                  activeWidth: getWidth(60),
                  unactiveWidth: getWidth(60),
                  activeColor: korange,
                  unActiveColor: korangeOpacity,
                  active: false),
              // SizedBox(
              //   width: getWidth(6),
              // ),
              Indicators(
                  height: getHeight(9),
                  activeWidth: getWidth(60),
                  unactiveWidth: getWidth(60),
                  activeColor: korange,
                  unActiveColor: korangeOpacity,
                  active: false),
              // SizedBox(
              //   width: getWidth(6),
              // ),
              Indicators(
                  height: getHeight(9),
                  activeWidth: getWidth(60),
                  unactiveWidth: getWidth(60),
                  activeColor: korange,
                  unActiveColor: korangeOpacity,
                  active: false),
            ],
          ),
          SizedBox(
            height: getHeight(15),
          ),
          Text(
            '*Note: Use this security code to proceed with your order',
            style: inputText5.copyWith(color: kblackLow),
          )
        ],
      ),
    );
  }
}
