import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  StorageService._internal();

  final GetStorage _storage = GetStorage();

  static StorageService get instance => _instance;

  set accessToken(String token) {
    _storage.write('accessToken', token);
  }

  String? get getAccessToken {
    return _storage.read('accessToken');
  }

  set firstName(String token) {
    _storage.write('firstName', token);
  }

  void deleteFirstName() {
    _storage.remove('firstName');
  }

  String? get getFirstName {
    return _storage.read('firstName');
  }

  set lastName(String token) {
    _storage.write('lastName', token);
  }

  void deleteLastName() {
    _storage.remove('lastName');
  }

  String? get getLastName {
    return _storage.read('lastName');
  }

  set phoneNo(String token) {
    _storage.write('phoneNo', token);
  }

  void deletePhoneNo() {
    _storage.remove('phoneNo');
  }

  String? get getPhoneNo {
    return _storage.read('phoneNo');
  }

  set countryCode(String token) {
    _storage.write('countryCode', token);
  }

  void deleteCountryCode() {
    _storage.remove('countryCode');
  }

  String? get getCountryCode {
    return _storage.read('countryCode');
  }

  set email(String token) {
    _storage.write('dvToken', token);
  }

  String? get getEmail {
    return _storage.read('dvToken');
  }

  set userId(String userId) {
    _storage.write('userId', userId);
  }

  String? get getUserId {
    return _storage.read('userId');
  }

  set forgetUserId(String userId) {
    _storage.write('forgotPasswordId', userId);
  }

  String? get getForgetUserId {
    return _storage.read('forgotPasswordId');
  }

  set forgetRequestId(String userId) {
    _storage.write('forgotUserId', userId);
  }

  String? get getForgetRequestId {
    return _storage.read('forgotUserId');
  }

  set customerId(String userId) {
    _storage.write('customerId', userId);
  }

  String? get getcustomerId {
    return _storage.read('customerId');
  }

  void clearAll() {
    _storage.erase().then((_) {
      print("All data erased successfully");
    }).catchError((error) {
      print("Error clearing storage: $error");
    });
  }
}
