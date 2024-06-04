import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/controller/cubits/user_info/user_info_cubit.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/authentication_service.dart';
import 'package:wael/view/widget/auth/textfdnumsignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';

class HeadOfProfilePage extends StatefulWidget {
  const HeadOfProfilePage({super.key});

  @override
  State<HeadOfProfilePage> createState() => _HeadOfProfilePageState();
}

class _HeadOfProfilePageState extends State<HeadOfProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserInfoCubit, UserInfoState>(
              bloc: UserInfoCubit()..getuserInfo(),
              builder: (context, state) {
                if (state is UserInfoFetched) {
                  final userInfo = state.userInfo;
                  _nameController.text = userInfo.user.name;
                  _phoneController.text = userInfo.phone;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userInfo.user.name,
                        style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userInfo.phone,
                        style: TextStyle(
                            color: AppColor.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      EditProfileButton(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        onPressed: () {
                          _nameController.text = userInfo.user.name;
                          _phoneController.text = userInfo.phone;
                          Get.defaultDialog(
                            title: 'Edit Profile',
                            content: SizedBox(
                              width: 300.w,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextFdSignInUp(
                                      controller: _nameController,
                                      keyboardType: TextInputType.name,
                                      texthint: 'Enter your full name',
                                      textlabel: 'Full name',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This filed is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFdNumSignInUp(
                                        textprefix: '0 933 666 555',
                                        keyboardType: TextInputType.number,
                                        textlabel: 'Phone number',
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Phone number is required';
                                          } else if (!RegExp(
                                                  r'^(\+?963|0)?9\d{8}$')
                                              .hasMatch(value)) {
                                            return 'Make sure to enter syrian number';
                                          }
                                          return null;
                                        },
                                        controller: _phoneController)
                                  ],
                                ),
                              ),
                            ),
                            textConfirm: 'confirm',
                            onConfirm: () async {
                              try {
                                await AuthenticationService.updateUserInfo(
                                    name: _nameController.text,
                                    phone: _phoneController.text);

                                _nameController.clear();
                                _phoneController.clear();
                               setState(() {
                                  Get.back();
                               });
                                Get.snackbar('Congrats',
                                    'You information has been updated',
                                    snackPosition: SnackPosition.BOTTOM);
                              } on HttpException catch (e) {
                                Get.snackbar('Congrats', e.message,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                            textCancel: 'cancel',
                            buttonColor: AppColor.blue,
                          );
                        },
                      ),
                    ],
                  );
                } else if (state is UserInfoFailure) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abd',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '0968645606',
                              style: TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      EditProfileButton(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        onPressed: () {},
                      ),
                    ],
                  );
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       width: 200,
                  //       height: 200,
                  //       color: AppColor.blue,
                  //       child: Text(state.errorMessage),
                  //     ),
                  //     EditProfileButton(
                  //       nameController: _nameController,
                  //       phoneController: _phoneController,
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Abd alraouf hussein',
                            style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '0968645606',
                            style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      EditProfileButton(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        onPressed: () {},
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Divider(
              color: AppColor.yellow,
              thickness: 3.w,
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.onPressed});
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Edit your info',
        style: TextStyle(color: AppColor.white, fontSize: 13.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            side: BorderSide(
              color: AppColor.yellow,
              width: 2.w,
            )),
      ),
    );
  }
}
