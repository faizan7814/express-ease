import 'package:express_ease/controllers/profile_controller/profile_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/ui/order_history/order_history_card.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Order History'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: getHeight(28))),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: paragraph,
                    ),
                    SizedBox(
                      height: getHeight(14),
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectDate(
                            context, controller.fromSelectedDate);
                      },
                      child: Container(
                        height: getHeight(43),
                        width: getWidth(160),
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(15), vertical: getHeight(8)),
                        decoration: BoxDecoration(
                          color: klightGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            SizedBox(
                              width: getWidth(12),
                            ),
                            Obx(() {
                              return Text(
                                controller.formatter
                                    .format(controller.fromSelectedDate.value),
                                style: paragraph,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getWidth(48),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To',
                      style: paragraph,
                    ),
                    SizedBox(
                      height: getHeight(14),
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectDate(
                            context, controller.toSelectedDate);
                      },
                      child: Container(
                        height: getHeight(43),
                        width: getWidth(160),
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(15), vertical: getHeight(8)),
                        decoration: BoxDecoration(
                          color: klightGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            SizedBox(
                              width: getWidth(12),
                            ),
                            Obx(() {
                              return Text(
                                controller.formatter
                                    .format(controller.toSelectedDate.value),
                                style: paragraph,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.orderDetailScreen);
                      },
                      child: const OrderHistoryCard());
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: getHeight(20), // Space between items
                    color: Colors.transparent, // Transparent space
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
