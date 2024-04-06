import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/widget/auth/btnsignin_up.dart';
import 'package:wael/view/widget/auth/bodyofsignin.dart';
import 'package:wael/view/widget/auth/headofsignin_up.dart';
import 'package:wael/view/widget/auth/textbtnsignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';
import 'package:wael/view/widget/auth/textfdpasssignin_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControolerEmplement());
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadOfSignInUp(text: '11'.tr),
              const BodyofSignIn(),
              TextFdSignInUp(
                texthint: '12'.tr,
                textlabel: '13'.tr,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFdPassSignInUp(
                texthint: '14'.tr,
                txetlabel: '15'.tr,
              ),
              const SizedBox(
                height: 15,
              ),
              TextBtnSugnInUp(
                text: '16'.tr,
                onPressed: () {},
              ),
              TextBtnSugnInUp(
                text: '17'.tr,
                onPressed: () {
                  Get.offAllNamed(AppRoute.signUp);
                },
              ),
              const SizedBox(
                height: 80,
              ),
              BtnSignInUp(
                txet: '18'.tr,
                onPressed: () {
                  Get.offNamed(AppRoute.signUp);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
