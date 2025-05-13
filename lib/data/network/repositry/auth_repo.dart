import 'package:express_ease/data/modals/signup_model.dart';
import 'package:express_ease/data/network/api_provider/api_provider.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/res/app_constants/constants.dart';
import 'package:express_ease/data/network/default_error_message.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  final SignupModel _signupModel = SignupModel();
  final _storageServices = StorageService.instance;
  AuthRepo();

  Future<Response> retryApiCall(
    Function apiCall,
    String url, {
    int retries = 3,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    Response? response;
    for (int i = 0; i < retries; i++) {
      try {
        response = await apiCall();

        if (response != null && response.statusCode == 503) {
          return response;
        }

        if (response != null && response.statusCode == 200) {
          return response;
        }
      } catch (e) {
        print("Error during API call: $e");
        debugPrint('POST Request to: ${Constants.baseUrl}$url');

        debugPrint(
            'Request Headers: ${_apiProvider.httpClient.defaultDecoder}');
        debugPrint('Response: ${response!.body}');
      }

      print("Retrying... Attempt ${i + 1} of $retries");
      await Future.delayed(retryDelay);
    }

    return AppDefaultResponses.defaultErrorResponse;
  }

  Future<Response> signUpRepo(
      {required String firstName,
      required String lastName,
      required String email,
      required String countryCode,
      required String phoneNumber,
      required String password,
      required String dvToken}) async {
    Map<String, dynamic> body = _signupModel.toJson();

    return await retryApiCall(() {
      return _apiProvider.postData(
        Constants.signUp,
        body: body,
      );
    },
    Constants.signUp
    );
  }

  Future<Response> signinRepo(
      {required String email,
      required String password,
      required String dvToken}) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "dvToken": dvToken
    };

    return await retryApiCall(() => _apiProvider.postData(
          Constants.signIn,
          body: body,
        ),
        Constants.signIn);
  }

  Future<Response> forgotPasswordRepo({required String email}) async {
    Map<String, dynamic> body = {'email': email};

    return await retryApiCall(() {
      return _apiProvider.postData(Constants.forgotPassword, body: body);
    },Constants.forgotPassword);
  }

  Future<Response> changePasswordRepo({
    required String userId,
    required String forgetRequestID,
    required String newPassword,
    required String otp,
  }) {
    Map<String, dynamic> body = {
      "userId": userId,
      "forgetRequestId": forgetRequestID,
      "password": newPassword,
      "OTP": otp
    };
    return retryApiCall(
        () => _apiProvider.postData(Constants.changePassword, body: body),Constants.changePassword);
  }

  Future<Response> logoutRepo() async {
    Map<String, String> headers = {
      'accessToken': _storageServices.getAccessToken!
    };

    return await retryApiCall(
        () => _apiProvider.getdata(Constants.logout, headers: headers),Constants.logout);
  }
}
