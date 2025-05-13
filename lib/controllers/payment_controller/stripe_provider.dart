import 'package:get/get.dart';

class StripeProvider extends GetConnect {
  createPaymentIntent(String amount, String currency, String customerId) async {
    String url = 'https://api.stripe.com/v1/payment_intents';
    print('apiprovider run');
    print("amount$amount");
    print("currency$currency");

    Map<String, dynamic> body = {
      "amount": amount,
      "currency": currency,
      'customer': customerId,
      "payment_method_types[]": "card",
      'setup_future_usage': 'on_session',
    };

    String encodedBody = body.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');

    Map<String, String> headers = {
      'Authorization':
          'Bearer sk_test_51QrYwKCtSQhx4DZU1kR1GlmhvJ2uD2FDQJsAq8aQjRa58QudmjvVHk3gC9H8gnMUByJs8HbMfdXmWCSqt3z5QXr20028oLRNVR',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    var response = await post(
      url,
      encodedBody,
      headers: headers,
    );
    print("response.statusCode ${response.statusCode}");
    if (response.statusCode == 200) {
      print('apiprovider run response ${response.body}');
      return response.body;
    } else {
      throw Exception('Failed to create payment intent: ${response.body}');
    }
  }

  Future<String> createCustomer(String userId) async {
    const url = "https://api.stripe.com/v1/customers";
    Map<String, String> body = {
      'customer': userId,
      'payment_method_types[]': 'card',
    };

    final response = await post(
      url,
      body,
      headers: {
        'Authorization':
            'Bearer sk_test_51QrYwKCtSQhx4DZU1kR1GlmhvJ2uD2FDQJsAq8aQjRa58QudmjvVHk3gC9H8gnMUByJs8HbMfdXmWCSqt3z5QXr20028oLRNVR',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if (response.statusCode == 200) {
      final data = response.body;
      print("✅ Customer Created: ${data['id']}");
      return data['id'].toString();
    } else {
      throw Exception("❌ Failed to Create Customer: ${response.body}");
    }
  }

  /// 🔹 Fetch Ephemeral Key (Unlocks Saved Cards)
  Future<String> getEphemeralKey(String customerId) async {
    const url = "https://api.stripe.com/v1/ephemeral_keys";

    Map<String, String> body = {
      'customer': customerId,
    };

    String encodedBody = body.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
    final response = await post(
      url,
      encodedBody,
      headers: {
        'Authorization':
            'Bearer sk_test_51QrYwKCtSQhx4DZU1kR1GlmhvJ2uD2FDQJsAq8aQjRa58QudmjvVHk3gC9H8gnMUByJs8HbMfdXmWCSqt3z5QXr20028oLRNVR',
        'Stripe-Version': '2023-10-16',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if (response.statusCode == 200) {
      final data = response.body;
      print("✅ Ephemeral Key Created!");
      return data["secret"].toString();
    } else {
      throw Exception("❌ Failed to Get Ephemeral Key: ${response.body}");
    }
  }
}
