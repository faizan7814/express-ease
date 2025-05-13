import 'package:express_ease/res/data_bindings/data_binding.dart';
import 'package:express_ease/res/routes/app_routes.dart';
import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51QrYwKCtSQhx4DZUWTepuLQMo5lOQ3dfDtkfxKowxao2MuvH522qh2aZICuRdldeZ04wRX25th9kKXe5iLy04njL004K3L4eRH';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
      initialBinding: DataBinding(),
      initialRoute: RouteNames.splashScreen,
    );
  }
}


// import 'package:express_ease/ui/parcel_status/track_on_map.dart';
// import 'package:flutter/foundation.dart';



// import 'utils/size_config.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart' show Stripe;
// import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  

//   if (defaultTargetPlatform == TargetPlatform.android) {
  
//   }
//   Stripe.publishableKey =
//       'pk_test_51QrYwKCtSQhx4DZUWTepuLQMo5lOQ3dfDtkfxKowxao2MuvH522qh2aZICuRdldeZ04wRX25th9kKXe5iLy04njL004K3L4eRH';
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return GetMaterialApp(
//         debugShowCheckedModeBanner: false, home: TrackOnMap());
//   }
// }
