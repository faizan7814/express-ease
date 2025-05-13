import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/appbar.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/my_widgets/my_input_field.dart';
import 'package:express_ease/my_widgets/my_outlined_doted.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/ui/home/send_parcel/category_list_item.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendParcelScreen extends StatelessWidget {
  SendParcelScreen({super.key});

  final controller = Get.find<BookingParcelController>();
  final validation = Validation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Send Parcel'),
      body: Form(
        key: controller.parcelDetailFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kmainPadding,
          ),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(padding: EdgeInsets.only(top: getHeight(27))),
              Text(
                'LET`S START WITH PACKAGE DETAILS',
                style: title1NullShok.copyWith(color: kblackLow),
              ),
              SizedBox(height: getHeight(26)),
              Text('What are you sending?',
                  style: inputText1.copyWith(color: kpurple)),
              SizedBox(height: getHeight(22)),
              SizedBox(
                height: getHeight(89),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () => controller.onSelectedCategory(index),
                      child: Obx(() {
                        final isSelected =
                            controller.selectedCategoryIndex.value == index;
                        return ListItem(
                          // categoryElement: controller.parcelCategories[index],
                          isSelected: isSelected,
                        );
                      }),
                    );
                  },
                ),
              ),
              SizedBox(height: getHeight(30)),
              Text('What`s the weight of your parcel?',
                  style: inputText1.copyWith(color: kpurple)),
              SizedBox(height: getHeight(21)),
              MyInputField(
                  sufixText: 'lbs',
                  keyboardType: TextInputType.phone,
                  textController: controller.weightOfParcel,
                  hint: '0.0'),
              SizedBox(height: getHeight(30)),
              Text('What are the dimensions of the Parcel?',
                  style: inputText1.copyWith(color: kpurple)),
              SizedBox(height: getHeight(15)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'I want to provide dimensions in inches(in)',
                    style: inputText5.copyWith(color: kblackOpacity),
                  ),
                  const Spacer(),
                  Obx(() {
                    return Transform.scale(
                      scaleX: .6,
                      scaleY: .5,
                      child: Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: controller.isSwitchedInch.value,
                        onChanged: (bool value) {
                          controller.isSwitchedInch.toggle();
                        },
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: getHeight(16),
              ),
              Row(
                children: [
                  Expanded(child: Obx(() {
                    return MyInputField(
                        title: 'Lenth',
                        keyboardType: TextInputType.phone,
                        tilteStyle: inputText7.copyWith(color: kpurple),
                        textController: controller.lenthOfParcel,
                        sufixText:
                            controller.isSwitchedInch.value ? 'in' : 'cm',
                        hint: '0.0');
                  })),
                  SizedBox(width: getWidth(19)),
                  Expanded(child: Obx(() {
                    return MyInputField(
                      title: 'Width',
                      keyboardType: TextInputType.phone,
                      tilteStyle: inputText7.copyWith(color: kpurple),
                      textController: controller.widthOfParcel,
                      hint: '0.0',
                      sufixText: controller.isSwitchedInch.value ? 'in' : 'cm',
                    );
                  })),
                  SizedBox(width: getWidth(19)),
                  Expanded(child: Obx(() {
                    return MyInputField(
                      // validate: validation.validateField,
                      // errorText: validation
                      //     .validateField(controller.lenthOfParcel.text),
                      title: 'Height',
                      keyboardType: TextInputType.phone,

                      tilteStyle: inputText7.copyWith(color: kpurple),
                      textController: controller.heightOfParcel,
                      hint: '0.0',
                      sufixText: controller.isSwitchedInch.value ? 'in' : 'cm',
                    );
                  })),
                ],
              ),
              const SizedBox(height: 30),
              Text('Estd. Worth of Parcel',
                  style: inputText1.copyWith(color: kpurple)),
              const SizedBox(height: 8),
              Text(
                  'Please provide the approximate worth of package. Rate will be calculated on the basis of worth.',
                  style: inputText5.copyWith(color: kblackOpacity)),
              const SizedBox(height: 19),
              MyInputField(
                  // validate: validation.validateField,
                  // errorText:
                  //     validation.validateField(controller.lenthOfParcel.text),
                  keyboardType: TextInputType.phone,
                  textController: controller.worthOfparcel,
                  hint: '0.0',
                  sufixText: '\$'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Insurance',
                          style: inputText3.copyWith(color: kpurple)),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit ipsum dolor amet consectetur.',
                        style: inputText5.copyWith(color: kblackOpacity),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Obx(() {
                    return SizedBox(
                      height: getHeight(25),
                      width: getWidth(50),
                      child: Transform.scale(
                        scaleX: .8,
                        scaleY: .7,
                        child: Switch(
                          value: controller.isSwitchedInsure.value,
                          onChanged: (bool value) {
                            controller.isSwitchedInsure.toggle();
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: getHeight(49),
              ),
              MyOutlinedButtonDotedBorder(
                  text: 'Add New Package',
                  textColor: kpurple,
                  onPressed: () {
                    controller.addPackage();
                  }),
              SizedBox(
                height: getHeight(15),
              ),
              CustomButton(
                text: 'Submit & Continue',
                onPressed: () {
                  controller.submitPackage();

                  Get.toNamed(RouteNames.pickupDetails);

                  // controller.isSwitchedInsure.value
                  //     ? Get.toNamed('/pickupDetails')
                  //     : Get.defaultDialog(
                  //         title: 'Insurance Popup',
                  //         titleStyle: inputText1.copyWith(color: kblack),
                  //         radius: 0,
                  //         contentPadding: const EdgeInsets.all(30),
                  //         titlePadding: const EdgeInsets.only(top: 40),
                  //         content: Text(
                  //           textAlign: TextAlign.center,
                  //           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ''',
                  //           style: inputText8.copyWith(
                  //               color: kblackOpacity,
                  //               fontSize: getFont(14),
                  //               fontWeight: FontWeight.w400),
                  //         ),
                  //         confirm: CustomButton(
                  //             text: 'Confirm',
                  //             onPressed: () {
                  //               Get.back();
                  //               Get.toNamed(RouteNames.pickupDetails);
                  //             }),
                  //       );
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 48)),
            ]),
          ),
        ),
      ),
    );
  }
}
