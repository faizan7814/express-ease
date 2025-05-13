import 'package:express_ease/data/modals/serializable.dart';

class EditProfileModel extends Serializable {
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNum;

  EditProfileModel({
    this.firstName,
    this.lastName,
    this.countryCode,
    this.phoneNum,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        countryCode: json["countryCode"],
        phoneNum: json["phoneNum"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "countryCode": countryCode,
        "phoneNum": phoneNum,
      };
}
