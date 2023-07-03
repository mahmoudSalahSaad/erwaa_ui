
import 'package:erwaa/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? initial  ;
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    initial = sharedPref.getString("lang") == null ? const Locale("ar"): Locale(sharedPref.getString("lang"))  ;
    changeAppLang(initial!.languageCode) ;
  }
  String? langCode ;

  changeAppLang(String lang) async {
   initial = Locale(lang) ;
    sharedPref.setString("lang" ,lang) ;
    await  Get.updateLocale(initial!) ;
    notifyChildrens();
  }


}