import 'package:express_ease/data/network/api_provider/stripe_provider.dart';
import 'package:express_ease/data/storage_services/storage_services.dart';
import 'package:express_ease/ui/home/order_summary/order_confirmed.dart';
import 'package:express_ease/utils/custom_progress_indicator/cutom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final stripeProvider = StripeProvider();

  final _storageServices = StorageService.instance;

  TextEditingController holderName = TextEditingController();
  TextEditingController acountNo = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController codeCVV = TextEditingController();

  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(String amount) async {
   String? customerId = _storageServices.getcustomerId;
    String? ephemeralKey;

    if (customerId == null) {
      customerId =
          await stripeProvider.createCustomer('12345678');

      _storageServices.customerId = customerId;
    }
    try {
       CustomProgressIndicator.show();
      print("Initializing Payment...");

      print("customer id is here............ $customerId");

      paymentIntentData =
          await stripeProvider.createPaymentIntent('200', 'USD', customerId);

      String clientSecret = paymentIntentData!["client_secret"];

      print("client secret  is here............ $clientSecret");

      if (clientSecret.isEmpty) {
        throw Exception("Missing Payment Intent Client Secret");
      }

      ephemeralKey = await stripeProvider.getEphemeralKey(customerId);

      print("empheral key is here..........$ephemeralKey");

      try {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "Express Ease",
            customerId: customerId,
            customerEphemeralKeySecret: ephemeralKey,
          ),
        );
         CustomProgressIndicator.hide();
        print(" Payment Sheet Initialized Successfully");
      } catch (e) {
        print("Error Initializing Payment Sheet: $e");
      }

      print("Payment Sheet Initialized ");

      await Stripe.instance.presentPaymentSheet();

      print("Payment Successful & Card Saved!");
      Get.to(() => const OrderConfirmed());
    } catch (e) {
      print("Payment Failed: $e");
    }
  }
}
