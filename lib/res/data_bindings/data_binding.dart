import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/controllers/booking_parcel/booking_parcel_controller.dart';
import 'package:express_ease/data/network/api_provider/api_provider.dart';
import 'package:express_ease/data/network/repositry/auth_repo.dart';
import 'package:express_ease/data/network/repositry/profile_repo.dart';
import 'package:express_ease/ui/map/map_controller.dart';

import 'package:get/get.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => BookingParcelController(), fenix: true);
    Get.lazyPut(() => AuthRepo());
    Get.lazyPut(() => ApiProvider());
    Get.lazyPut(() => ProfileRepo());
     Get.lazyPut(() => MapController());
  }
}
