import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {required this.icon,
      required this.title,
      required this.subTitle,
      super.key});

  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(65),
      decoration: BoxDecoration(
        color: klightBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      padding:  EdgeInsets.symmetric(horizontal: getWidth(15)),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: getHeight(30),
            width: getWidth(50),
            fit: BoxFit.contain,
          ),
           SizedBox(width: getWidth(23)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: heading6.copyWith(color: kblack)),
                 SizedBox(height: getHeight(4)),
                Text(
                  subTitle.length > 4
                      ? subTitle
                              .substring(0, subTitle.length - 4)
                              .replaceAll(RegExp(r'.'), '.') +
                          subTitle.substring(subTitle.length - 4)
                      : subTitle,
                  style: inputText5.copyWith(color: kblackOpacity),
                )
              ],
            ),
          ),
          const Icon(
            arrowForwardIos,
            size: 18,
            color: kblackOpacity,
          ),
        ],
      ),
    );
  }
}
