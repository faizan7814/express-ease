import 'package:express_ease/controllers/payment_controller/payment_controller.dart';
import 'package:express_ease/data/modals/address_model.dart';
import 'package:express_ease/data/modals/category_model.dart';
import 'package:express_ease/data/modals/packege_model.dart';
import 'package:express_ease/data/modals/response_modal.dart';
import 'package:express_ease/data/modals/vehicle_model.dart';
import 'package:express_ease/data/network/repositry/booking_repo.dart';
//import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/res/chek_internet.dart/chek_internet.dart';

import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/custom_progress_indicator/cutom_progress_indicator.dart';
import 'package:express_ease/utils/cutom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingParcelController extends GetxController {
  //final AddressModel _addressModel = AddressModel();
  final _bookingParcelRepo = BookingRepo();
  final checkInternet = CheckInternet();
  final controller = Get.put(PaymentController());
  AddressModel? pickupAddress;
  AddressModel? receiverAddress;
  VehicleModel? selectedVehicle;
  //final StorageService _storageService = StorageService.instance;

  RxInt selectedPageIndex = 2.obs;

  void onSelect(int index) {
    selectedPageIndex.value = index;
  }

  RxInt selectedCategoryIndex = 0.obs;
  void onSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  RxBool isSwitchedInch = false.obs;

  RxBool isSwitchedInsure = false.obs;

  RxBool isSwitchedLoad = false.obs;

  RxInt receiverAddressSelectedIndex = 0.obs;

  RxInt selectedIndexDate = 2.obs;
  void togleSelectedDateIndex(int index) {
    selectedIndexDate.value = index;
  }

  void toggleReceiverAddress(int index) {
    receiverAddressSelectedIndex.value = index;
  }

  RxInt pickupAddressSelectedIndex = 0.obs;
  void togglePickupAddress(int index) {
    pickupAddressSelectedIndex.value = index;
  }

  RxInt selectedVehicleIndex = 0.obs;
  void onSelectVehicle(int index) {
    selectedVehicleIndex.value = index;
  }

  TextEditingController pickupDate = TextEditingController();
  TextEditingController pickuptime = TextEditingController();

  TextEditingController weightOfParcel = TextEditingController();
  TextEditingController lenthOfParcel = TextEditingController();
  TextEditingController widthOfParcel = TextEditingController();
  TextEditingController heightOfParcel = TextEditingController();
  TextEditingController worthOfparcel = TextEditingController();

  TextEditingController searchAddress = TextEditingController();
  TextEditingController addressTitle = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  TextEditingController zipCode = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  TextEditingController receiverFullName = TextEditingController();
  TextEditingController receiverEmail = TextEditingController();

  TextEditingController receiverPhoneNo = TextEditingController();
  RxString receiverCountryCode = ''.obs;

  TextEditingController notes = TextEditingController();

  final GlobalKey<FormState> parcelDetailFormKey = GlobalKey();
  final GlobalKey<FormState> addAddressFormKey = GlobalKey();
  final GlobalKey<FormState> receiverDetailsFormKey = GlobalKey();

  RxString pickupAddressId = ''.obs;

  RxString receiverAddressId = ''.obs;

  RxString selectedVehicleId = ''.obs;

  RxList<Package> packageList = <Package>[].obs;
  RxList userAddresses = [].obs;
  RxList parcelCategories = [].obs;
  RxList vehicleList = [].obs;

//clear address feilds after adding
  void clearAddAddressFeild() {
    searchAddress.clear();
    addressTitle.clear();
    building.clear();
    city.clear();
    state.clear();
    zipCode.clear();
    countryCode.clear();
    phoneNo.clear();
  }

  void clearPackageFields() {
    weightOfParcel.clear();
    heightOfParcel.clear();
    widthOfParcel.clear();
    lenthOfParcel.clear();
    worthOfparcel.clear();
    isSwitchedInch.value = false;
    isSwitchedInsure.value = false;
  }

//geting all cateories
  void getCategory() async {
    final response = await _bookingParcelRepo.getCategoryRepo();

    print(response.statusCode);

    if (response.statusCode == 200) {
      ResponseModel responseModel =
          ResponseModel.fromJson(response.body, CategoryData.fromJson);
      if (responseModel.responseCode == '1') {
        CategoryData categoryData = responseModel.response![0];

        //asign category list to local variable
        parcelCategories.value = categoryData.categories!;

        print(parcelCategories.length);
      }
    }
  }

//add adress and used for profile saved addresses, pickup address, receiver address
  void addAddresse() async {
    if (addAddressFormKey.currentState!.validate()) {
      CustomProgressIndicator.show();

      //cheking internet
      if (!await checkInternet.hasInternet()) {
        Future.delayed(const Duration(milliseconds: 100), () {
          CustomProgressIndicator.hide();
        });
        return;
      }

      try {
        final response = await _bookingParcelRepo.addAddresseRepo(
            axactAddress: searchAddress.text,
            title: addressTitle.text,
            building: building.text,
            city: city.text,
            zipCode: zipCode.text,
            countryCode: countryCode.text,
            phoneNumber: phoneNo.text,
            state: state.text);
        CustomProgressIndicator.hide();
        if (response.statusCode == 200) {
          ResponseModel responseModel =
              ResponseModel.fromJson(response.body, AddressModel.fromJson);

          if (responseModel.responseCode == '1') {
            CustomToast.showSuccess(
                'added huwehfuiohuehu weeu uqweheu wjihu wuhe',
                responseModel.responseMessage ?? 'address added');

            CustomProgressIndicator.hide();
            getAddresses();
            clearAddAddressFeild();
          } else {
            CustomToast.showError('Not Added',
                responseModel.responseMessage ?? 'Adddress not added');
          }
        }
      } catch (e) {
        CustomToast.showError('Not Added', e.toString());
        print('$e');
      }
    }
  }

  void getAddresses() async {
    //cheking internet
    if (!await checkInternet.hasInternet()) {
      Future.delayed(const Duration(milliseconds: 100), () {});
      return;
    }
    CustomProgressIndicator.show();
    try {
      final response = await _bookingParcelRepo.getAddressRepo();
      CustomProgressIndicator.hide();
      if (response.statusCode != 200) {}

      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        ResponseModel responseModel =
            ResponseModel.fromJson(response.body, AddressModel.fromJson);
        print(responseModel.responseCode);
        if (responseModel.responseCode == '1') {
          userAddresses.value = responseModel.response!;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //delete saved address

  void deleteAddress(int index) async {
    AddressModel deletedAddress = userAddresses[index];
    String addressId = deletedAddress.id.toString();

    CustomProgressIndicator.show();
    if (!await checkInternet.hasInternet()) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.back();
      });
      return;
    }
    final response =
        await _bookingParcelRepo.deleteAddresseRepo(addressId: addressId);
    Get.back();
    if (response.statusCode == 200) {
      final responseData = response.body;

      if (responseData['ResponseCode'] == '1') {
        CustomToast.showSuccess(
            'Deleted', responseData['ResponseMesssage'] ?? 'address Deleted');
        getAddresses();
      }
    }
  }

//submitting parcel details after validating

  void addPackage() {
    if (parcelDetailFormKey.currentState!.validate()) {
      CategoryElement selectedCategory =
          parcelCategories[selectedCategoryIndex.value];

      String selectedCategoryId = selectedCategory.id!.toString();
      String selectedCategoryName = selectedCategory.name!;
      String unit = isSwitchedInch.value ? 'in' : 'cm';

      Package package = Package(
        categoryId: selectedCategoryId,
        categoryName: selectedCategoryName,
        weight: weightOfParcel.text,
        height: heightOfParcel.text,
        length: lenthOfParcel.text,
        width: weightOfParcel.text,
        estWorth: worthOfparcel.text,
        insurance: isSwitchedInsure.value,
        unit: unit,
      );
      packageList.add(package);
      clearPackageFields();
    } else {
      return;
    }
  }

  void submitPackage() async {
    if (packageList.isNotEmpty) {
      Get.toNamed(RouteNames.pickupDetails);
      //getAddresses();
    } else {
      if (parcelDetailFormKey.currentState!.validate()) {
       // addPackage();
        //getAddresses();
        Get.toNamed(RouteNames.pickupDetails);
      }
    }
  }

  void getpickupAddress() {
    // DateTime now = DateTime.now();
    // DateTime date = now.add(Duration(days: selectedIndexDate.value));
    // print(
    //     ' selcted pickup address id is here ${date.toString().substring(0, 10)}');
    // print(' selcted pickup time is here ${pickuptime.text}');

    pickupAddress = userAddresses[pickupAddressSelectedIndex.value];
    pickupAddressId.value = pickupAddress!.id.toString();

    print(' selcted pickup address id is here ${pickupAddress!.id}');
  }

  void getReceiverAddress() {
    if (receiverDetailsFormKey.currentState!.validate()) {
      receiverAddress = userAddresses[receiverAddressSelectedIndex.value];
      receiverAddressId.value = receiverAddress!.id.toString();
      Get.toNamed(RouteNames.otherDetails);
      print(' selcted receiver address id is here ${receiverAddress!.id}');
    }
    // DateTime now = DateTime.now();
    // DateTime date = now.add(Duration(days: selectedIndexDate.value));
    // print(
    //     ' selcted pickup address id is here ${date.toString().substring(0, 10)}');
    // print(' selcted pickup time is here ${pickuptime.text}');
  }

  void getVehicle() async {
    List<Map<String, dynamic>> packageListMap =
        packageList.map((user) => user.toJson()).toList();

    final response =
        await _bookingParcelRepo.getVehicleRepo(package: packageListMap);

    if (response.statusCode == 200) {
      ResponseModel responseModel =
          ResponseModel.fromJson(response.body, VehicleModel.fromJson);
      final responsedata = responseModel.response;
      if (responseModel.responseCode == '1') {
        vehicleList.value = responsedata!;
      }
    }
  }

  void otherDetails() {
    selectedVehicle = vehicleList[selectedVehicleIndex.value];

    selectedVehicleId.value = selectedVehicle!.id.toString();

    print('selected vehicle id is here ${selectedVehicleId.value}');
    print('vehicle list lenth is here ${notes.text}');
  }

  void bookParcel() async {
    
    // List<Map<String, dynamic>> packageListMap =
    //     packageList.map((user) => user.toJson()).toList();

   

    // try {
    //   final response = await _bookingParcelRepo.bookParcelRepo(
    //       package: packageListMap,
    //       rName: receiverFullName.text,
    //       rEmail: receiverEmail.text,
    //       rAlPhoneNum: receiverFullName.text,
    //       pickupDate: pickupDate.text,
    //       note: notes.text,
    //       userId: _storageService.getUserId!,
    //       vehiclesTypeId: selectedVehicleId.value,
    //       loadUnload: isSwitchedLoad.value,
    //       pickupId: pickupAddressId.value,
    //       deliveryId: receiverAddressId.value);
    //   print('response status code is here ${response.statusCode}');

    //   CustomProgressIndicator.hide();

    //   //   if (response.statusCode == 200) {
    //   //     ResponseModel responseModel =
    //   //         ResponseModel.fromJson(response.body, AddressModel.fromJson);
    //   //     print(
    //   //         'responsemodel status code is here ${responseModel.responseCode}');
    //   //     if (responseModel.responseCode == '1') {
    //   //       Get.toNamed(RouteNames.cardsScreen);
    //   //       CustomToast.showSuccess('Parcel Booking',
    //   //           responseModel.responseMessage ?? 'Patrcel Booked Successfully');
    //   //     }
    //   //     if (responseModel.responseCode == '0') {
    //   //       print('response status code is here ${responseModel.responseCode}');
    //   //       CustomToast.showError('Parcel Booking Failed',
    //   //           responseModel.responseMessage ?? 'Patrcel Booking failed');
    //   //     }
    //   //   }
    // } catch (e) {
    //   print(e);
    // }
    
    controller.makePayment('200');
  }
}
