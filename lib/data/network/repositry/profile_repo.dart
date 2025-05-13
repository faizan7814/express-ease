import 'package:express_ease/data/network/api_provider/api_provider.dart';
import 'package:express_ease/data/network/default_error_message.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/res/app_constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileRepo extends GetxService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  final _storageServices = StorageService.instance;

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

  Future<Response> changePasswordRepo({
    required String oldPassword,
    required String newPasssword,
  }) async {
    Map<String, String> headers = {
      'accessToken': _storageServices.getAccessToken!
    };
    print(' acceess token when api call${_storageServices.getAccessToken!}');

    Map<String, String> body = {
      "oldPassword": oldPassword,
      "newPassword": newPasssword,
    };

    return await retryApiCall(
        () => _apiProvider.putdata(Constants.changePasswordProfile,
            headers: headers, body: body),
        Constants.changePasswordProfile);
  }

  Future<Response> editProfileRepo({
    required String firstName,
    required String lastName,
    required String phoneNo,
    required String countryCode,
  }) async {
    Map<String, String> headers = {
      'accessToken': _storageServices.getAccessToken!
    };
    print(' acceess token when api call${_storageServices.getAccessToken!}');

    Map<String, String> body = {
      "firstName": firstName,
      "lastName": lastName,
      "countryCode": countryCode,
      "phoneNum": phoneNo,
    };

    return await retryApiCall(
        () => _apiProvider.putdata(Constants.editProfile,
            headers: headers, body: body),
        Constants.editProfile);
  }
}
