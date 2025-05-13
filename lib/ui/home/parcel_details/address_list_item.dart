import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class AddressListItem extends StatelessWidget {
  const AddressListItem(
      {required this.address, required this.isSelected, super.key});

  final List<String> address;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              height: getHeight(130),
              width: getWidth(233),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: isSelected ? korange : klightBlue,
                ),
                color: klightBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(address[0]),
              ),
            )),
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
              )),
      ],
    );
  }
}
