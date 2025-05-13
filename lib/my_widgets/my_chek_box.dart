import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox(
    
     {
    this.completed = false,
    this.onGoing = false,
    super.key,
  }) : assert(!(completed && onGoing), 'Both completed and onGoing cannot be true at the same time.');

  
  
  final bool completed;
  final bool onGoing;

  @override
  Widget build(BuildContext context) {
    if (completed) {
      return Container(
        height:  getHeight(18),
        width:  getWidth(18),
        decoration: BoxDecoration(
          color: kpurple,
          borderRadius: BorderRadius.circular(getWidth(10)),
        ),
        child: const Icon(Icons.check, size: 8, color: kwhite),
      );
    } else if (onGoing) {
      return Container(
        height:  getHeight(18),
        width:  getWidth(18),
        decoration: BoxDecoration(
color: kpurpleOpacity,
          borderRadius: BorderRadius.circular(getWidth(10)),
        ),
        child: Center(
          child: Container(
            height: getHeight(8),
            width: getWidth(8),
            decoration: BoxDecoration(
              color: kpurple,
              borderRadius: BorderRadius.circular(getWidth(10)),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height:  getHeight(16),
        width:  getWidth(16),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(getWidth(10)),
        ),
      );
    }
  }
}
