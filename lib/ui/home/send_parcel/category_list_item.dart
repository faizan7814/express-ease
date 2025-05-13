import 'package:express_ease/data/send_parcel_data/send_parcel_listview_data.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:express_ease/utils/mystyles.dart';

class ListItem extends StatelessWidget {
  const ListItem({
   // required this.categoryElement,
    required this.isSelected, super.key});

 
  final bool isSelected;
 // final CategoryElement categoryElement;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Container(
            height: getHeight(79),
            width: getWidth(79),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: isSelected ? korange : klightBlue,
              ),
              color: klightBlue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icons[0],
                    height: getHeight(27),
                    width: getWidth(23),
                  ),
                  const Spacer(),
                  Text(
                    'Name',
                    style: inputText7.copyWith(color: kblack),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isSelected)
          Positioned(
              top: 6,
              right: 6,
              child: Container(
                height: getHeight(18),
                width: getWidth(18),
                decoration: BoxDecoration(
                  color: kpurple,
                  borderRadius: BorderRadius.circular(getWidth(10)),
                ),
                child: const Icon(Icons.check, size: 8, color: kwhite),
              ))
      ],
    );
  }
}
