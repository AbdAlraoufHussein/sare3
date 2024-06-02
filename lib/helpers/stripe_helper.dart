import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class StripeHelper {
  static void stripe({required int salePrice}) async {
    final paymentIntent = await createPaymentIntent(salePrice.toString(), 'INR');
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            billingDetails: BillingDetails(
                name: 'YOUR NAME',
                email: 'YOUREMAIL@gmail.com',
                phone: 'YOUR NUMBER',
                address: Address(
                    city: 'YOUR CITY',
                    country: 'YOUR COUNTRY',
                    line1: 'YOUR ADDRESS 1',
                    line2: 'YOUR ADDRESS 2',
                    postalCode: 'YOUR PINCODE',
                    state: 'YOUR STATE')),
            paymentIntentClientSecret:
                paymentIntent!['client_secret'], //Gotten from payment intent
            style: ThemeMode.dark,
            merchantDisplayName: 'Ikay'));

    displayPaymentSheet();
  }

  //create Payment
  static createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await Dio(BaseOptions(headers: {
        'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
        'Content-Type': 'application/x-www-form-urlencoded'
      })).post(
        'https://api.stripe.com/v1/payment_intents',
        data: body,
      );
      return response.data;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

//calculate Amount
  static String calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  static void displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Payment succesfully completed')));
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}')));
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text('Unforeseen error: ${e}')));
      }
    }
  }
}
