import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wael/core/localization/changelangauge.dart';
import 'package:wael/core/localization/translation.dart';
import 'package:wael/core/services/services.dart';
import 'package:wael/routes.dart';
import 'package:wael/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      routes: routes,
      locale: controller.langauge,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      home: const Language(),
    );
  }
}
