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
                  HeadOfSignInUp(text: 'Sign Up_top'.tr),
                  const SizedBox(
                    height: 100,
                  ),
                  TextFdSignInUp(
                    texthint: 'Enter your name here'.tr,
                    textlabel: 'Full Name'.tr,
                    keyboardType: TextInputType.name,
                    onChanged: (p0) => 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdSignInUp(
                    texthint: 'Enter your email here_signUp'.tr,
                    textlabel: 'Email_signUp'.tr,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (p0) => 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdPassSignInUp(
                    texthint: 'Enter your Password here_signUp'.tr,
                    txetlabel: 'Password_signUp'.tr,
                    onChanged: (p0) => 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFdNumSignInUp(
                    textprefix: '+963'.tr,
                    textlabel: 'Phone'.tr,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBtnSugnInUp(
                      text: 'Have an acount ?'.tr,
                      onPressed: () {
                        Get.offNamed(AppRoute.signIn);
                      }),
                  const SizedBox(
                    height: 70,
                  ),
                  BtnSignInUp(txet: 'Sign Up_btn'.tr, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
