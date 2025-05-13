import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class SavedAddressItem extends StatelessWidget {
  const SavedAddressItem(
      {this.isSelected,
      //required this.userAddress,
      this.width,
      this.height,
      this.showDltIcon = false,
      this.onDelete,
      super.key});
 // final AddressModel userAddress;
  final bool? isSelected;
  final double? width;
  final double? height;
  final bool? showDltIcon;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height ?? getHeight(132),
          width: width ?? double.infinity,
          margin: const EdgeInsets.only(top: 3, right: 3),
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(15), vertical: getHeight(13)),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isSelected ?? false ? korange : klightBlue,
            ),
            color: klightBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                // userAddress.building ?? '',
                'any',
                style: inputText8.copyWith(color: kblackOpacity),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Text(
                // userAddress.city ?? '',
                'any',
                style: inputText8.copyWith(color: kblackOpacity),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Text(
                // userAddress.zip ?? '',
                'any',
                style: inputText8.copyWith(color: kblackOpacity),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // userAddress.phoneNum ?? '',
                    'any',
                    style: inputText8.copyWith(color: kblackOpacity),
                  ),
                  if (showDltIcon!)
                    InkWell(
                        onTap: onDelete,
                        child: Image.asset(
                          delete,
                          height: getHeight(22),
                          width: getWidth(18),
                          color: kerrorRed,
                        )),
                ],
              ),
            ],
          ),
        ),
        if (isSelected ?? false)
          Positioned(
              top: 2,
              right: 2,
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
