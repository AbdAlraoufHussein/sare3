import 'package:get/get.dart';
import 'package:wael/core/constant/imageasset.dart';
import 'package:wael/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'Sare3 Store'.tr,
      image: AppImageAsset.onBoardingImageOne,
      body: 'Welcome to our store'.tr),
  OnBoardingModel(
    title: 'Our special one'.tr,
    image: AppImageAsset.onBoardingImageTwo,
    body:
        'We offer you our application, which is a place where we collect exclusive discounts on a wide range of products'.tr,
  ),
  OnBoardingModel(
    title: 'What else do we have?'.tr,
    image: AppImageAsset.onBoardingImageThree,
    body:
        'We provide you with an electronic payment feature to reserve your goods to ensure your right to take them'.tr,
  )
];
