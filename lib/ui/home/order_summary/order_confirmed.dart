import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(orderConfirmedImage,height: getHeight(102.5),width: getWidth(116.7),),
                SizedBox(height: getHeight(38.96),),
                Text('Order Confirmed',style: heading2.copyWith(color: kpurple),),
                SizedBox(height: getHeight(15),),
                Text('Your order has been placed. You will soon receive a\nconfirmation via email address.',textAlign: TextAlign.center,style: inputText5.copyWith(color: kblackOpacity),),
                SizedBox(height: getHeight(31.6),),
                CustomButton(text: 'Done', onPressed: (){

                  Get.offAllNamed(RouteNames.homeScreen);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}