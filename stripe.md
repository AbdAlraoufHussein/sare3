# Stripe payment

- open vpn
- sign in to your stripe account
- open [api keys](https://dashboard.stripe.com/test/apikeys) 
- download flutter env package:
```bash
flutter pub add flutter_dotenv
``` 
- create **.env** file in your root folder 
- add in your **pubspec.yaml** file  the **[.env](.env)** file in assets:
```yaml
assets:
  - .env
```
- in your **main.dart**:
```dart
// add this line.
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // add this line.
  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
}
```
- add stripe publishable key to your **.env** file:
```env
STRIPE_PUBLISHABLE_KEY="Your publishable key"
STRIPE_SECRET_KEY="Your secret key"
```
- download flutter stripe package:
```bash
flutter pub add flutter_stripe
``` 
- in [gradle.build](android/app/build.gradle):
```gradle
defaultConfig {
        // change this line
        minSdkVersion 21
    }
```
- in [styles.xml](android/app/src/main/res/values/styles.xml) remove the old code and add this instead:
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Theme applied to the Android Window while the process is starting when the OS's Dark Mode setting is off -->
    <style name="LaunchTheme" parent="Theme.AppCompat.Light.NoActionBar">
        <!-- Show a splash screen on the activity. Automatically removed when
             Flutter draws its first frame -->
        <item name="android:windowBackground">@drawable/launch_background</item>
    </style>
    <!-- Theme applied to the Android Window as soon as the process has started.
         This theme determines the color of the Android Window while your
         Flutter UI initializes, as well as behind your Flutter UI while its
         running.
         
         This Theme is only used starting with V2 of Flutter's Android embedding. -->
    <style name="NormalTheme" parent="Theme.MaterialComponents">
        <item name="android:windowBackground">?android:colorBackground</item>
    </style>
</resources>
```
- in android/app/src/main/kotlin/com/the name of your prject/android/MainActivity.kt remove the old code and add this instead:
```kt
// add this line
import io.flutter.embedding.android.FlutterFragmentActivity

// change this line
class MainActivity: FlutterFragmentActivity() 
```
- create [proguard-rules.pro](android/app/proguard-rules.pro) file:
```txt
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider
```
- run this commands:
```bash
flutter clean
flutter pub get
```
- run the app again to check everthing is good.
- create [StripeHelper](lib/helpers/stripe_helper.dart):
```dart
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class StripeHelper {
  static void stripe() async {
    final paymentIntent = await createPaymentIntent('100', 'INR');
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
        'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
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

```

- add this in [gradle.build](android/app/build.gradle)
```gradle
android {
    namespace "com.example.wael"
    // addthis line
    compileSdkVersion 34
```
- now use this helper in your code.