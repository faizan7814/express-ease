import 'package:express_ease/data/modals/serializable.dart';

class SignupModel extends Serializable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? countryCode;
  final String? phoneNum;
  final String? gkey;
  final String? deviceToken;

  SignupModel({
     this.firstName,
     this.lastName,
     this.email,
     this.password,
     this.countryCode,
     this.phoneNum,
     this.gkey,
     this.deviceToken,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      countryCode: json['countryCode'],
      phoneNum: json['phoneNum'],
      gkey: json['gkey'],
      deviceToken: json['deviceToken'],
    );
  }

  // Method for converting an instance to a JSON map
  @override
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'countryCode': countryCode,
      'phoneNum': phoneNum,
      'gkey': gkey,
      'deviceToken': deviceToken,
    };
  }
}

