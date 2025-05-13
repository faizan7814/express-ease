import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';


class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({
    this.showDeleteIcon = false,
    super.key});
final bool showDeleteIcon;
  @override
  Widget build(BuildContext context,) {
    return Container(
            height: getHeight(146),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(15), vertical: getHeight(13)),
            decoration: BoxDecoration(
              color: klightGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package 1',
                      style: inputText1.copyWith(color: kblack),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'Size',
                      style: inputText5.copyWith(color: kblackOpacity),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'Dimentions',
                      style: inputText5.copyWith(color: kblackOpacity),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'Category',
                      style: inputText5.copyWith(color: kblackOpacity),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'worth',
                      style: inputText5.copyWith(color: kblackOpacity),
                    ),
                  ],
                ),
                SizedBox(
                  width: getWidth(16),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '(\$150)',
                      style: inputText1.copyWith(color: kblack),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      '1X Medium',
                      style: inputText5.copyWith(color: kblack),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      '3 x 3 x 3',
                      style: inputText5.copyWith(color: kblack),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'Documents',
                      style: inputText5.copyWith(color: kblack),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      '\$500',
                      style: inputText5.copyWith(color: kblack),
                    ),
                  ],
                ),
                const Spacer(),
                if(showDeleteIcon)
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        delete,
                        color: korange,
                        height: getHeight(19),
                        width: getWidth(16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}