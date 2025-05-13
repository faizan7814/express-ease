import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/my_widgets/custom_button.dart';
import 'package:express_ease/ui/home/send_parcel/bottom_sheet/date_sheet_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';

class DatePickerSheet extends StatelessWidget {
  DatePickerSheet({required this.onConfirm, super.key});

  final controller = Get.find<BookingParcelController>();
  final Function() onConfirm;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    String formattedTime = selectedTime.format(context);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pickup Date',
                    style: inputText3.copyWith(color: kpurple),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  SizedBox(
                    height: getHeight(79),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        DateTime date = now.add(Duration(days: index));
                        String dateString = DateFormat('d').format(date);
                        String weekday = DateFormat('EEE').format(date);

                        return Padding(
                            padding: EdgeInsets.only(right: getWidth(10)),
                            child: Obx(() {
                              return InkWell(
                                  onTap: () {
                                    controller.togleSelectedDateIndex(index);
                                  },
                                  child: DateSheetItem(
                                      dateString: dateString,
                                      weekday: weekday,
                                      isSelected:
                                          controller.selectedIndexDate.value ==
                                              index));
                            }));
                      },
                    ),
                  ),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  Text(
                    'Select Time',
                    style: inputText3.copyWith(color: kpurple),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  Container(
                    height: getHeight(48),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: .5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formattedTime),
                        InkWell(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());

                              controller.pickuptime.text =
                                  pickedTime.toString();
                            },
                            child: const Icon(Icons.arrow_drop_down_outlined)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(20),
            ),
            CustomButton(text: 'Confirm', onPressed: onConfirm),
            SizedBox(
              height: getHeight(25),
            )
          ],
        ),
      ),
    );
  }
}
