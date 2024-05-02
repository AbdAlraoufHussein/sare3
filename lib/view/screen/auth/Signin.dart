import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/controller/signin_controller.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/screen/main_page/home_page.dart';
import 'package:wael/view/screen/main_page/main_page.dart';
import 'package:wael/view/widget/auth/btnsignin_up.dart';
import 'package:wael/view/widget/auth/bodyofsignin.dart';
import 'package:wael/view/widget/auth/headofsignin_up.dart';
import 'package:wael/view/widget/auth/textbtnsignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';
import 'package:wael/view/widget/auth/textfdpasssignin_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final SigninControllerImplement signinController =
      Get.put(SigninControllerImplement());

  @override
  void initState() {
    super.initState();

    Get.put(OnBoardingControolerEmplement());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadOfSignInUp(text: 'Sign In_top'.tr),
              const BodyofSignIn(),
              TextFdSignInUp(
                texthint: 'Enter your email here_signIn'.tr,
                textlabel: 'Email_signIn'.tr,
                keyboardType: TextInputType.emailAddress,
                onChanged: (p0) => 0,
                // onChanged: (email) => signinController.email = email,
              ),
               SizedBox(
                height: 20.h,
              ),
              TextFdPassSignInUp(
                texthint: 'Enter your Password here_signIn'.tr,
                txetlabel: 'Password_signIn'.tr,
                onChanged: (p0) => 0,
                // onChanged: (password) => signinController.password = password,
              ),
               SizedBox(
                height: 15.h,
              ),
              TextBtnSugnInUp(
                text: 'Forget Password'.tr,
                onPressed: signinController.signin,
              ),
              TextBtnSugnInUp(
                text: 'Create an acount ?'.tr,
                onPressed: () {
                  Get.offAllNamed(AppRoute.signUp);
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              BtnSignInUp(
                txet: 'Sign In_btn'.tr,
                onPressed: () {
                  Get.off(MainPage());
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
