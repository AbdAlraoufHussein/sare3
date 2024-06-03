import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wael/core/constant/routes.dart';
import 'package:wael/core/services/authentication_service.dart';
import 'package:wael/view/screen/main_page/about_the_app.dart';
import 'package:wael/view/screen/main_page/contact_us.dart';
import 'package:wael/view/screen/main_page/terms_and_conditions.dart';
import 'package:wael/view/widget/profile_page/haed_of_profile_page.dart';
import 'package:wael/view/widget/profile_page/logout_profile.dart';
import 'package:wael/view/widget/profile_page/row_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadOfProfilePage(),
            RowProfile(
              onTap: () {
                Get.to(TermsAndCondition());
              },
              image: 'assets/images/rule_image_profile.png',
              text: 'Terms and Conditions',
              howfar: 60.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            RowProfile(
              onTap: () {
                Get.to(AboutTheApp());
              },
              image: 'assets/images/about_image_profile.png',
              text: 'About the application',
              howfar: 60.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            RowProfile(
              onTap: () {
                Get.to(ContactUs());
              },
              image: 'assets/images/contactus_image_profile.png',
              text: 'Contact us',
              howfar: 150.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            LogoutProfilePage(
              onTap: () async {
                await AuthenticationService.logOut();
                Get.offAllNamed(AppRoute.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}
