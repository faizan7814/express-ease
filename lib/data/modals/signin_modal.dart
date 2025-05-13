import 'package:express_ease/data/modals/serializable.dart';

class LoginModel extends Serializable {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? accessToken;

  LoginModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userId: json["UserId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        accessToken: json["accessToken"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "accessToken": accessToken,
      };
}
