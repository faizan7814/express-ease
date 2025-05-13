import 'package:express_ease/data/modals/serializable.dart';

class ResponseModel <T>extends Serializable {
  String? responseCode;
  String? responseMessage;
  String? errors;
  List<T>? response;

  ResponseModel({
    this.responseCode,
    this.responseMessage,
    this.response,
    this.errors,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) =>
      ResponseModel(
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        response: json["Response"] == null
            ? []
            : List<T>.from(json["Response"].map((x) => fromJson(x))),
        errors: json["errors"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
        "Response": response,
        "errors": errors,
      };
}
