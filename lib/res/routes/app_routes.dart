import 'package:express_ease/res/routes/route_names.dart';
import 'package:express_ease/ui/auth/forgot_password_screen.dart';
import 'package:express_ease/ui/auth/login_screen.dart';
import 'package:express_ease/ui/auth/onboarding_screen.dart';
import 'package:express_ease/ui/auth/otp_screen.dart';
import 'package:express_ease/ui/auth/reset_password_screen.dart';
import 'package:express_ease/ui/auth/signup_screen.dart';
import 'package:express_ease/ui/auth/splash_screen.dart';
import 'package:express_ease/ui/auth/well_come_screen.dart';
import 'package:express_ease/ui/home/home_page/home_screen.dart';

import 'package:express_ease/ui/home/order_summary/order_confirmed.dart';
import 'package:express_ease/ui/home/order_summary/order_summary_screen.dart';
import 'package:express_ease/ui/home/parcel_details/other_detail.dart';
import 'package:express_ease/ui/home/parcel_details/pickup_detaile.dart';
import 'package:express_ease/ui/home/parcel_details/receiver_details.dart';
import 'package:express_ease/ui/home/send_parcel/send_parcel_screen.dart';
import 'package:express_ease/ui/order_history/order_detail_screen.dart';
import 'package:express_ease/ui/parcel_status/track_parcel_screen.dart';
import 'package:express_ease/ui/parcel_status/track_on_map.dart';
import 'package:express_ease/ui/profile/cards_screen.dart';
import 'package:express_ease/ui/profile/change_password_screen.dart';
import 'package:express_ease/ui/profile/edit_profile_screen.dart';
import 'package:express_ease/ui/profile/saved_addresses_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() {
    return [
      GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),
      GetPage(
          name: RouteNames.onBoardingScreen, page: () => OnBoardingScreen()),
      GetPage(
          name: RouteNames.wellComeScreen, page: () => const WellComeScreen()),
      GetPage(name: RouteNames.loginScreen, page: () => LoginScreen()),
      GetPage(name: RouteNames.signupScreen, page: () => SignupScreen()),
      GetPage(
          name: RouteNames.forgotPasswordScreen,
          page: () => VerifyEmailScreen()),
      GetPage(
          name: RouteNames.resetPasswordScreen,
          page: () => ResetPasswordScreen()),
      GetPage(name: RouteNames.homeScreen, page: () => HomeScreen()),
      GetPage(
          name: RouteNames.sendParcelScreen, page: () => SendParcelScreen()),
      GetPage(name: RouteNames.pickupDetails, page: () => PickupDetaile()),
      GetPage(
          name: RouteNames.receiverDetails,
          page: () => const ReceiverDetails()),
      GetPage(name: RouteNames.otherDetails, page: () => OtherDetail()),
      GetPage(name: RouteNames.orderSummary, page: () => OrderSummaryScreen()),
      GetPage(
          name: RouteNames.orderConfirmed, page: () => const OrderConfirmed()),
      GetPage(name: RouteNames.editProfile, page: () => EditProfileScreen()),
      GetPage(
          name: RouteNames.savedAddressesScreen,
          page: () => SavedAddressesScreen()),
      GetPage(name: RouteNames.cardsScreen, page: () => CardsScreen()),
      GetPage(
          name: RouteNames.changePasswordScreen,
          page: () => ChangePasswordScreen()),
      GetPage(
          name: RouteNames.orderDetailScreen,
          page: () => const OrderDetailScreen()),
      GetPage(
          name: RouteNames.trackParcelScreen, page: () => TrackParcelScreen()),
      GetPage(name: RouteNames.trackonMapscreen, page: () => TrackOnMap()),
      GetPage(name: RouteNames.otpScreen, page: () => OtpScreen()),
    ];
  }
}
