import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/ui/home/order_summary/order_summary.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Order Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: getHeight(25))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Details',
                    style: heading2.copyWith(color: kblack),
                  ),
                  Text('Order#12345678',
                      style: inputText3.copyWith(
                        color: kblackOpacity,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Completed',
                    style: paragraph.copyWith(color: korange),
                  ),
                  Text(
                    'Download',
                    style: heading7.copyWith(
                        color: kblack, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(23),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(18), vertical: getHeight(15)),
                height: getHeight(120),
                width: double.infinity,
                decoration: const BoxDecoration(color: klightGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 23,
                            child: Image.asset(
                              person,
                              height: getHeight(60),
                              width: getWidth(40),
                            )),
                        SizedBox(
                          width: getWidth(17),
                        ),
                        Text(
                          'Driver Name',
                          style: inputText3.copyWith(color: kblack),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(18),),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: inputText8.copyWith(
                          color: korange, // Main text color
                        ),
                        children: const[
                         TextSpan(
                            text: 'Provide feedback to driver?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  korange, // Custom underline color
                              decorationThickness:
                                  1, // Optional: Thickness of the underline
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getHeight(31),),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
             child:  OrderSummary(showDeleteIcon: false,),
           ),
           SizedBox(height: getHeight(40),),
           Divider(
          
            color: kblackLow,
            height: getHeight(4),
           ),
           SizedBox(height: getHeight(15),),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
             child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: inputText1.copyWith(color: kpurple),
                    ),
                    Text(
                      '\$200.00',
                      style: heading2.copyWith(color: kpurple),
                    ),
                  ],
                ),
           ),
              Padding(padding: EdgeInsets.only(bottom: getHeight(60)))
          ],
        ),
      ),
    );
  }
}
