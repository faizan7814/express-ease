import 'package:express_ease/controllers/payment_controller/payment_controller.dart';
import 'package:express_ease/data/cards_data/cards_data.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/my_outlined_doted.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/ui/profile/card_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardsScreen extends StatelessWidget {
  CardsScreen({super.key});
  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'My Cards',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: getHeight(41))),
            Text(
              'Your Saved Cards ',
              style: heading2.copyWith(color: kpurple),
            ),
            SizedBox(
              height: getHeight(25),
            ),
            SizedBox(
              height: getHeight(320),
              child: ListView.builder(
                itemCount: cardNames.length,
                itemBuilder: (context, int index) {
                  var cardData = cardNames[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getHeight(15)),
                    child: InkWell(
                      onTap: () {},
                      child: CardItem(
                        icon: cardData['icon'],
                        title: cardData['title'],
                        subTitle: cardData['cardNo'],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: getHeight(129),
            ),
            MyOutlinedButtonDotedBorder(
                text: 'Add New Card',
                onPressed: () {
                  controller.makePayment('200');
                }),
          ],
        ),
      ),
    );
  }
}
