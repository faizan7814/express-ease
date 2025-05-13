
import 'package:get/get.dart';

class AppDefaultResponses {
  static const int defaultErrorCode = 500;
  static const String defaultErrorMessage = "Something went wrong. Please try again later.";

  // Default error response
  static Response get defaultErrorResponse {
    return const Response(
      statusCode: defaultErrorCode,
      statusText: defaultErrorMessage,
      body: {
        'error': true,
        'message': defaultErrorMessage,
      },
    );
  }
}