import 'package:express_ease/data/network/api_provider/api_provider.dart';
import 'package:express_ease/data/network/default_error_message.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/res/app_constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingRepo extends GetxService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  final _storageServices = StorageService.instance;
  BookingRepo();

  Future<Response> retryApiCall(
    Function() apiCall,
    String url, {
    int retries = 2,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    Response? response;

    for (int i = 0; i <= retries; i++) {
      try {
        response = await apiCall();

        // If response is not null and has a valid status code
        if (response!.statusCode == 200 || response.statusCode == 503) {
          return response;
        }
      } catch (e) {
        debugPrint("Error during API call: $e");
        debugPrint('POST Request to: ${Constants.baseUrl}$url');
      }

      // Logging only if response exists
      if (response != null) {
        debugPrint('Response Status: ${response.statusCode}');
        debugPrint('Response Body: ${response.body}');
      }

      if (i < retries) {
        print("Retrying... Attempt ${i + 1} of $retries");
        await Future.delayed(retryDelay);
      }
    }

    return AppDefaultResponses.defaultErrorResponse;
  }

  Future<Response> getCategoryRepo() async {
    Map<String, String> headers = {
      'accessToken': _storageServices.getAccessToken!
    };

    return await retryApiCall(
        () => _apiProvider.getdata(Constants.getCategory, headers: headers),
        Constants.getCategory);
  }

  Future<Response> addAddresseRepo({
    required String title,
    required String axactAddress,
    required String building,
    required String countryCode,
    required String phoneNumber,
    required String city,
    required String zipCode,
    required String state,
  }) async {
    Map<String, dynamic> body = {
      "title": title,
      "city": city,
      "building": building,
      "state": state,
      "zip": zipCode,
      "countryCode": countryCode,
      "phoneNum": phoneNumber,
      "exactAddress": axactAddress,
      "UserId": _storageServices.getUserId,
    };

    debugPrint(' Add Address repo call Body is $body');
    return await retryApiCall(() {
      return _apiProvider.postData(Constants.addAdress, body: body);
    }, Constants.addAdress);
  }

  Future<Response> getAddressRepo() async {
    Map<String, String> headers = {
      'accessToken': _storageServices.getAccessToken!
    };

    return await retryApiCall(
        () => _apiProvider.getdata(Constants.getAdress, headers: headers),
        Constants.getAdress);
  }

  Future<Response> deleteAddresseRepo({
    required String addressId,
  }) async {
    Map<String, dynamic> body = {
      "addressId": addressId,
    };

    debugPrint(' Add Address repo call Body is $body');
    return await retryApiCall(() {
      return _apiProvider.postData(Constants.deleteAddress, body: body);
    }, Constants.deleteAddress);
  }

  Future<Response> getVehicleRepo({
    required List<Map<String, dynamic>> package,
  }) async {
    Map<String, dynamic> body = {
      "packages": package,
    };

    debugPrint(' Add Address repo call Body is $body');
    return await retryApiCall(() {
      return _apiProvider.postData(Constants.getVehicle, body: body);
    }, Constants.getVehicle);
  }

  Future<Response> bookParcelRepo({
    required List<Map<String, dynamic>> package,
    required String rName,
    required String rEmail,
    required String rAlPhoneNum,
    required String pickupDate,
    required String note,
    required String userId,
    required String vehiclesTypeId,
    required bool loadUnload,
    required String pickupId,
    required String deliveryId,
  }) async {
    Map<String, dynamic> body = {
      "packages": package,
      "rName": rName,
      "rEmail": rEmail,
      "rAlPhoneNum": rAlPhoneNum,
      "pickupDate": pickupDate,
      "note": note,
      "UserId": userId,
      "VehiclesTypeId": vehiclesTypeId,
      "load_unload": loadUnload,
      "pickupId": pickupId,
      "deliveryId": deliveryId,
    };

    debugPrint(' bookParcel repo  Body is $body');
    return await retryApiCall(() {
      return _apiProvider.postData(Constants.bookParcel, body: body);
    }, Constants.bookParcel);
  }
}
