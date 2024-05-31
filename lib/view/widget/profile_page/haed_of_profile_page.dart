import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/authentication_service.dart';
import 'package:wael/data/model/api/models/auth_info_model.dart';
import 'package:wael/view/widget/auth/textfdnumsignin_up.dart';
import 'package:wael/view/widget/auth/textfdsignin_up.dart';

class HeadOfProfilePage extends StatelessWidget {
  const HeadOfProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    var userData;
    return FutureBuilder<AuthInfoModel>(
      future: AuthenticationService.getUserInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,
              ),
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
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Edit Profile',
                    content: Container(
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
                                  } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
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
                      final error = await AuthenticationService.updateUserInfo(
                          name: _nameController.text,
                          phone: _phoneController.text);
                      print('pressed');
                      if (error == null) {
                        _nameController.clear();
                        _phoneController.clear();
                        Get.back();
                      }
                    },
                    textCancel: 'cancel',
                    buttonColor: AppColor.blue,
                  );
                },
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
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                color: AppColor.yellow,
                thickness: 3.w,
              ),
            ],
          );
        }

        userData = snapshot.data;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              userData!.name,
              style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              userData.phone,
              style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    actions: [Text('data')],
                    content: Text('data'),
                    title: 'data');
              },
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: AppColor.yellow,
              thickness: 3.w,
            ),
          ],
        );
      },
    );
  }
}
