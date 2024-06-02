import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/controller/onboarding_controller.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/services/authentication_service.dart';
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
  @override
  void initState() {
    super.initState();

    Get.put(OnBoardingControolerEmplement());
  }

  GlobalKey<FormState> _formState = GlobalKey();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formState,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeadOfSignInUp(text: 'Sign In_top'.tr),
                const BodyofSignIn(),
                TextFdSignInUp(
                  controller: _emailController,
                  texthint: 'Enter your email here_signIn'.tr,
                  textlabel: 'Email_signIn'.tr,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (p0) => 0,
                  // onChanged: (email) => signinController.email = email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                        .hasMatch(value)) {
                      return 'Make sure to enter @gmail.com';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFdPassSignInUp(
                  controller: _passwordController,
                  texthint: 'Enter your Password here_signIn'.tr,
                  txetlabel: 'Password_signIn'.tr,
                  onChanged: (p0) => 0,
                  // onChanged: (password) => signinController.password = password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be equel or more than 8 character.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                // TextBtnSugnInUp(
                //   text: 'Forget Password'.tr,
                //   onPressed: signinController.signin,
                // ),
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
                  onPressed: () async {
                    if (_formState.currentState!.validate()) {
                      final error = await AuthenticationService.logIN(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (error == null) {
                        _emailController.clear();
                        _passwordController.clear();
                        Get.toNamed(AppRoute.mainPage);
                      }
                      
                    }
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
