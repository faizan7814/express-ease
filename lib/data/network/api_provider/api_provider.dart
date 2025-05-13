import 'package:express_ease/res/app_constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect implements GetxService {
  ApiProvider() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = const Duration(seconds: 40);
  }

  Future<Response> postData(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    debugPrint('====> API Call: [${Constants.baseUrl + url}]\nBody: $body');

    Response response;

    try {
      response = await post(
        url,
        body,
      );
      debugPrint('Response: ${response.bodyString}');
    } catch (e) {
      debugPrint('Request failed: $e');
      throw Exception('Network error: $e');
    }

    return handleData(url, response);
  }

  Future<Response> getdata(
    String url, {
    Map<String, String>? headers,
  }) async {
    debugPrint('====> API Call get: [${Constants.baseUrl + url}');

    Response response;

    try {
      response = await get(
        headers: headers,
        url,
      );
      debugPrint('Response: ${response.bodyString}');
    } catch (e) {
      debugPrint('Request failed: $e');
      throw Exception('Network error: $e');
    }

    return handleData(url, response);
  }

//put Api
  Future<Response> putdata(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    debugPrint(
        '====> API Call PUT: [$body$headers ${Constants.baseUrl + url}]');

    Response response;

    try {
      response = await put(
        url,
        body,
        headers: headers,
      );
      debugPrint('Response: ${response.bodyString}');
    } catch (e) {
      debugPrint('Request failed: $e');
      throw Exception('Network error: $e');
    }

    return handleData(url, response);
  }

  Future<Response> handleData(String url, Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      String errorMessage = '';
      String bodyString = response.bodyString ?? 'No details provided';
      Map<String, dynamic> body = response.body ?? {};

      switch (response.statusCode) {
        case 400:
          errorMessage = 'Bad Request: $bodyString';
          break;
        case 401:
          errorMessage = 'Unauthorized: $bodyString';
          break;
        case 403:
          errorMessage = 'Forbidden: $bodyString';
          break;
        case 404:
          errorMessage = 'Not Found: $bodyString';
          break;
        case 500:
          errorMessage = 'Server Error: $bodyString';
          break;
        default:
          errorMessage =
              'Unexpected Error [${response.statusCode}]: $bodyString';
      }

      debugPrint('API Error: $errorMessage');
      return Response(
        statusCode: response.statusCode,
        statusText: errorMessage,
        bodyString: bodyString,
        body: body,
      );
    }
  }
}
