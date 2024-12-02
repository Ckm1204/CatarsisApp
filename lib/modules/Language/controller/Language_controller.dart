import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  RxString currentLang = 'es'.obs;

  void changeLocale() {
    if (currentLang.value == 'en') {
      currentLang.value = 'es';
    } else {
      currentLang.value = 'en';
    }
    Get.updateLocale(Locale(currentLang.value, ''));
  }
}