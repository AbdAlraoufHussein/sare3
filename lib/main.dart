import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:wael/core/localization/changelangauge.dart';
import 'package:wael/core/localization/translation.dart';
import 'package:wael/core/services/services.dart';
import 'package:wael/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wael/view/screen/onboarding.dart';
import 'package:wael/view/screen/splash_screen.dart';

//test 2

void main() async {
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(392.7, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        routes: routes,
        locale: controller.langauge,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
