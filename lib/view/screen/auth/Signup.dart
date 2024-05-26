import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/services/authentication_service.dart';
import 'package:wael/view/widget/auth/btnsignin_up.dart';
import 'package:wael/view/widget/auth/headofsignin_up.dart';
import 'package:wael/view/widget/auth/textbtnsignin_up.dart';
import 'package:wael/view/widget/auth/textfdnumsignin_up.dart';
import 'package:wael/view/widget/auth/textfdpasssignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formState = GlobalKey();
    final _nameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _phoneController = TextEditingController();
    final _emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formState,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadOfSignInUp(text: 'Sign Up_top'.tr),
                    SizedBox(
                      height: 100.h,
                    ),
                    TextFdSignInUp(
                      controller: _nameController,
                      texthint: 'Enter your name here'.tr,
                      textlabel: 'Full Name'.tr,
                      keyboardType: TextInputType.name,
                      onChanged: (p0) => 0,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Full name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFdSignInUp(
                      controller: _emailController,
                      texthint: 'Enter your email here_signUp'.tr,
                      textlabel: 'Email_signUp'.tr,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (p0) => 0,
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
                      texthint: 'Enter your Password here_signUp'.tr,
                      txetlabel: 'Password_signUp'.tr,
                      onChanged: (p0) => 0,
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
                      height: 20.h,
                    ),
                    TextFdNumSignInUp(
                      controller: _phoneController,
                      textprefix: '0 988 556 633',
                      textlabel: 'Phone'.tr,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                            .hasMatch(value)) {
                          return 'Make sureto enter syrian number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextBtnSugnInUp(
                        text: 'Have an acount ?'.tr,
                        onPressed: () {
                          Get.offNamed(AppRoute.signIn);
                        }),
                    SizedBox(
                      height: 70.h,
                    ),
                    BtnSignInUp(
                        txet: 'Sign Up_btn'.tr,
                        onPressed: () async {
                          if (_formState.currentState!.validate()) {
                            final error = await AuthenticationService.signup(
                              username: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              phone: _phoneController.text,
                            );
                            if (error == null) {
                              _emailController.clear();
                              _passwordController.clear();
                              Get.toNamed(AppRoute.mainPage);
                            } else {
                              Get.defaultDialog(
                                  content: Text(error.toString()));
                            }
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
