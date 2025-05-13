import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
         height: getHeight(156),
         width: double.infinity,
         padding: EdgeInsets.symmetric(
             horizontal: getWidth(15), vertical: getHeight(8)),
         decoration: BoxDecoration(
           color: klightGrey,
           borderRadius: BorderRadius.circular(5),
         ),
         child: Column(
           children: [
             Row(
               children: [
                 RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(
                         text: 'Order',
                         style: heading6.copyWith(color: kdarkGrey),
                       ),
                       TextSpan(
                           text: '   ' '#1234567',
                           style: heading6.copyWith(color: kblack)),
                     ],
                   ),
                 ),
                 const Spacer(),
                 Text(
                   '12-02-2022',
                   style: inputText5.copyWith(color: kdarkGrey),
                 ),
               ],
             ),
             SizedBox(
               height: getHeight(20),
             ),
             Row(
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(
                       'Pickup',
                       style: inputText6.copyWith(color: kblackOpacity),
                     ),
                     SizedBox(height: getHeight(29),),
                     Text(
                       'Dropoff',
                       style: inputText6.copyWith(color: kblackOpacity),
                     ),
                   ],
                 ),
                 SizedBox(
                   width: getWidth(25),
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(
                     
                       'Street 123, G1 Johar Town Lahore\nCity, Punjab',
                       style: inputText6.copyWith(color: kblack),
                     ),
                    SizedBox(height: getHeight(15),),
                     Text(
                       'Street 123, G1 Johar Town Lahore\nCity, Punjab',
                       style: inputText6.copyWith(color: kblack),
                     ),
                   ],
                 ),
               ],
             ),
             
             SizedBox(
               height: getHeight(4),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   '\$200.00',
                   style: heading4.copyWith(color: kpurple),
                 ),
               ],
             )
           ],
         ),
       );
  }
}
