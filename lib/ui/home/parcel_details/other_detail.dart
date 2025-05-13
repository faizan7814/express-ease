import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/data/modals/vehicle_model.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/images/images.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/custom_progress_indicator/cutom_progress_indicator.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OtherDetail extends StatelessWidget {
  OtherDetail({super.key});

  final controller = Get.find<BookingParcelController>();
  VehicleModel? vehicle;

  @override
  Widget build(BuildContext context) {
    final List<String> vehicles = [bike, car, bike, car, bike, car];

    return Scaffold(
      appBar: const MyAppBar(title: 'Other Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kmainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getHeight(40),
              ),
              Text(
                'Select Vehicle',
                style: inputText3.copyWith(
                    color: kpurple, height: getFont(18.79) / 16),
              ),
              SizedBox(
                height: getHeight(5),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
                style: inputText5.copyWith(
                  color: kblackOpacity,
                  height: getFont(13.79) / 12,
                ),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              SizedBox(
                height: getHeight(134),
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.vehicleList.isEmpty
                        ? 2
                        : controller.vehicleList.length,
                    itemBuilder: (context, int index) {
                      return controller.vehicleList.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(100)),
                              child: const CustomProgressIndicator(),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.onSelectVehicle(index);
                              },
                              child: Obx(() {
                                vehicle = controller.vehicleList[index];
                                bool isSelected =
                                    controller.selectedVehicleIndex.value ==
                                        index;
                                return Container(
                                  height: getHeight(134),
                                  width: getWidth(233),
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: isSelected ? korange : klightBlue,
                                    ),
                                    color: klightBlue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        vehicles[index],
                                        height: getHeight(72),
                                        width: getWidth(114),
                                      ),
                                      SizedBox(
                                        height: getHeight(15),
                                      ),
                                      Text(vehicle!.name ?? ''),
                                    ],
                                  )),
                                );
                              }),
                            );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(30),
              ),
              Row(
                children: [
                  Text(
                    'Add Delivery Notes',
                    style: inputText1.copyWith(
                      color: kpurple,
                      height: getFont(20.7) / 18,
                    ),
                  ),
                  Text(
                    '(optional)',
                    style: inputText6.copyWith(
                      color: kpurple,
                      height: getFont(13.79) / 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
              MyInputField(
                height: getHeight(117),
                textController: controller.notes,
                hint: 'Add comments here',
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(
                height: getHeight(30),
              ),
              SizedBox(
                height: getHeight(51),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Load/Offlaod',
                          style: inputText3.copyWith(
                            color: kpurple,
                            height: getFont(18.3) / 16,
                            wordSpacing: -1.0,
                          ),
                        ),
                        SizedBox(
                          height: getHeight(5),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit ipsum dolor amet consectetur.',
                          style: inputText5.copyWith(
                            color: kblackOpacity,
                            height: getFont(13.79) / 12,
                            wordSpacing: -1.5,
                          ),
                        ),
                      ],
                    ),

                    // Obx(() {
                    // return
                    const Spacer(),
                    SizedBox(
                      height: getHeight(25),
                      width: getWidth(50),
                      child: Transform.scale(
                          scaleX: .8,
                          scaleY: .7,
                          child: Obx(() {
                            return Switch(
                              value: controller.isSwitchedLoad.value,
                              onChanged: (bool value) {
                                controller.isSwitchedLoad.toggle();
                              },
                            );
                          })),
                    ),
                    // }),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(200),
              ),
              CustomButton(
                  text: 'Review my Parcel',
                  onPressed: () {
                    //controller.otherDetails();
                    Get.toNamed(RouteNames.orderSummary);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
