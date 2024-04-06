import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/view/widget/auth/btnsignin_up.dart';
import 'package:wael/view/widget/auth/headofsignin_up.dart';
import 'package:wael/view/widget/auth/textbtnsignin_up.dart';
import 'package:wael/view/widget/auth/textfdnumsignin_up.dart';
import 'package:wael/view/widget/auth/textfdpasssignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadOfSignInUp(text: '20'.tr),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFdSignInUp(
                    texthint: '21'.tr,
                    textlabel: '22'.tr,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdSignInUp(
                    texthint: '23'.tr,
                    textlabel: '24'.tr,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdPassSignInUp(
                    texthint: '25'.tr,
                    txetlabel: '26'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdPassSignInUp(
                    texthint: '27'.tr,
                    txetlabel: '28'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdNumSignInUp(
                    textprefix: '29'.tr,
                    textlabel: '30'.tr,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBtnSugnInUp(
                      text: '31'.tr,
                      onPressed: () {
                        Get.offNamed(AppRoute.signIn);
                      }),
                  const SizedBox(
                    height: 70,
                  ),
                  BtnSignInUp(txet: '32'.tr, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
