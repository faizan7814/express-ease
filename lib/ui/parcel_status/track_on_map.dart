import 'package:express_ease/my_widgets/my_outlined_button.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/permisssion_handler/communication_helper.dart';
import 'package:express_ease/my_widgets/map/search_map_screen.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class TrackOnMap extends StatelessWidget {
  TrackOnMap({super.key});

  final communicationHelper = CommunicationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: getHeight(540),
                child: SearchAddressScreen(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(24)),
                    Center(
                      child: Text(
                        'Your Parcel is out for delivery!',
                        style: buttonText2.copyWith(color: kpurple),
                      ),
                    ),
                    SizedBox(height: getHeight(28)),
                    Text(
                      'Estd. Delivery',
                      style: inputText6.copyWith(color: kblackLow),
                    ),
                    SizedBox(height: getHeight(10)),
                    Text(
                      '26 Jan, 2024  09:00 AM',
                      style: inputText8.copyWith(color: kblack),
                    ),
                    SizedBox(height: getHeight(33)),
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            profile,
                            fit: BoxFit.cover,
                            height: getHeight(48),
                            width: getWidth(48),
                          ),
                        ),
                        SizedBox(width: getWidth(17)),
                        Text(
                          'Driver Name',
                          style: inputText3.copyWith(color: kblack),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'GHK-165V',
                              style: inputText5.copyWith(color: kblackLow),
                            ),
                            Text(
                              'Vehicle Name',
                              style: inputText8.copyWith(color: kblack),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(height: getHeight(48)),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: getHeight(15), // Keeps buttons fixed at bottom
            left: kmainPadding,
            right: kmainPadding,
            child: Column(
              children: [
                MyOutlinedButton(
                  titleColor: kwhite,
                  backgroundColor: kpurple,
                  onPressed: () {
                    communicationHelper.makePhoneCall('555555345234');
                  },
                  titelText: 'Call Driver',
                  icon: Image.asset(
                    call,
                    height: 21,
                    width: 17,
                    color: kwhite,
                  ),
                  iconPadding: EdgeInsets.symmetric(horizontal: getWidth(22)),
                ),
                SizedBox(height: getHeight(15)),
                MyOutlinedButton(
                  titleColor: kwhite,
                  backgroundColor: kpurple,
                  onPressed: () {
                    communicationHelper.sendSms('252523525');
                  },
                  titelText: 'Message',
                  icon: Image.asset(
                    message,
                    height: 21,
                    width: 17,
                    color: kwhite,
                  ),
                  iconPadding: EdgeInsets.symmetric(horizontal: getWidth(22)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
