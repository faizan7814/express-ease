import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    required this.icon,
    required this.title,
    super.key});


final Widget icon;
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(48),
      decoration: const BoxDecoration(
        border: Border.symmetric(

        horizontal: BorderSide(
            width: .5,
            color: kblackOpacity,
          ),

        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20), ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: getWidth(22),),
            Text(title,style: inputText3.copyWith(color: kpurple),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,color: kpurple,size: 20,),
          ],
        ),
      ),
    );
  }
}