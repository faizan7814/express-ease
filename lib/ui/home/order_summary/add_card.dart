import 'package:express_ease/controllers/payment_controller/payment_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({required this.title, required this.buttonText, super.key});
  final String title;
  final String buttonText;

  final controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: title),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: getHeight(64))),
                Text(
                  'Add Card Details',
                  style: heading2.copyWith(color: kpurple),
                ),
                SizedBox(
                  height: getHeight(61),
                ),
                MyInputField(
                    title: 'Card holder Name',
                    tilteStyle: inputText1.copyWith(color: kpurple),
                    textController: controller.holderName,
                    hint: 'Enter full name'),
                SizedBox(
                  height: getHeight(22),
                ),
                MyInputField(
                    title: 'Acount Number',
                    keyboardType: TextInputType.phone,
                    tilteStyle: inputText1.copyWith(color: kpurple),
                    textController: controller.acountNo,
                    hint: 'xxxx-xxxx-xxxx-xxxx'),
                SizedBox(
                  height: getHeight(22),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                          title: 'Expiry',
                          keyboardType: TextInputType.phone,
                          tilteStyle: inputText1.copyWith(color: kpurple),
                          textController: controller.expiryDate,
                          hint: 'DD/MM/YY'),
                    ),
                    SizedBox(
                      width: getWidth(30),
                    ),
                    Expanded(
                      child: MyInputField(
                          title: 'CVV',
                          keyboardType: TextInputType.phone,
                          tilteStyle: inputText1.copyWith(color: kpurple),
                          textController: controller.codeCVV,
                          hint: '***'),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                        child: Icon(
                      Icons.check_box_outlined,
                      size: 19,
                    )),
                    SizedBox(
                      width: getWidth(15),
                    ),
                    Text(
                      'Save my payment details for next use',
                      style: inputText5.copyWith(color: kblack),
                    )
                  ],
                ),
                SizedBox(
                  height: getHeight(60),
                ),
                CustomButton(
                    text: buttonText,
                    onPressed: () {
                      
                    }),
              ],
            ),
          ),
        ));
  }
}
