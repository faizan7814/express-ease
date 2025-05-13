import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class DateSheetItem extends StatelessWidget {
  const DateSheetItem(
      {required this.dateString,
      required this.weekday,
      required this.isSelected,
      super.key});

  final bool isSelected;
  final String dateString;
  final String weekday;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(79),
      width: getWidth(60),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ?  kpurple : klightGrey ,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            dateString,
            style:
                inputText3.copyWith(fontWeight: FontWeight.w800, color: isSelected ? kwhite : kblackOpacity),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Text(
            weekday,
            style: inputText5.copyWith(
                fontWeight: FontWeight.w800, color: isSelected ? kwhite : kblackOpacity),
          ),
        ],
      ),
    );
  }
}
