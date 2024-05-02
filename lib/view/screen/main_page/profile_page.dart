import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wael/view/widget/profile_page/haed_of_profile_page.dart';
import 'package:wael/view/widget/profile_page/logout_profile.dart';
import 'package:wael/view/widget/profile_page/row_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadOfProfilePage(),
          SizedBox(
            height: 20.h,
          ),
          RowProfile(
            image: 'assets/images/rule_image_profile.png',
            text: 'Terms and Conditions',
            howfar: 60.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          RowProfile(
            image: 'assets/images/about_image_profile.png',
            text: 'About the application',
            howfar: 60.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          RowProfile(
            image: 'assets/images/contactus_image_profile.png',
            text: 'Contact us',
            howfar: 150.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          const LogoutProfilePage(),
        ],
      ),
    );
  }
}
