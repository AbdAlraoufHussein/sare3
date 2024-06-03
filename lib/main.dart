import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:wael/controller/cubits/product/product_cubit.dart';
import 'package:wael/controller/cubits/product_cart/product_cart_cubit.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/localization/changelangauge.dart';
import 'package:wael/core/localization/translation.dart';
import 'package:wael/core/services/my_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wael/view/screen/auth/Signin.dart';
import 'package:wael/view/screen/auth/Signup.dart';
import 'package:wael/view/screen/main_page/cart_page.dart';
import 'package:wael/view/screen/main_page/categories_page.dart';
import 'package:wael/view/screen/main_page/favorite_page.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/screen/main_page/main_page.dart';
import 'package:wael/view/screen/main_page/notifications.dart';
import 'package:wael/view/screen/main_page/profile_page.dart';
import 'package:wael/view/screen/onboarding.dart';
import 'package:wael/view/screen/splash_screen.dart';

//test 2

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.connectionTimeout = const Duration(seconds: 30);
    return client;
  }
}

void main() async {
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductCubit(),
      ),
      BlocProvider(
        create: (context) => ProductCartCubit(),
      ),
    ],
    child: const MyWidget(),
  ));
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
        locale: controller.langauge,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.splashScreen,
        getPages: [
          GetPage(
            name: AppRoute.splashScreen,
            page: () => const SplashScreen(),
            // middlewares: [MyMiddleWare()]
          ),
          GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
          GetPage(name: AppRoute.signIn, page: () => const SignIn()),
          GetPage(name: AppRoute.signUp, page: () => const SignUp()),
          GetPage(name: AppRoute.mainPage, page: () => const MainPage()),
          GetPage(
              name: AppRoute.favoritePage, page: () => const FavoratePage()),
          GetPage(
              name: AppRoute.notifications, page: () => const Notifications()),
          GetPage(name: AppRoute.homePage, page: () => const HomePage()),
          GetPage(
              name: AppRoute.cateroriesPage,
              page: () => const CategoriesPage()),
          GetPage(name: AppRoute.cartPage, page: () => const CartPage()),
          GetPage(name: AppRoute.profilePage, page: () => const ProfilePage()),
        ],
      ),
    );
  }
}
