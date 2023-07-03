import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:flutter/material.dart';

class SystemDialogs {

  static Future<AwesomeDialog> dialog(BuildContext context, {String? title , message})async{
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.infoReverse,
        animType: AnimType.scale,
        title: title!,
        headerAnimationLoop: false,
        //customHeader: Image.asset("assets/icons/icons8-home-96.png"),

        desc: '$message',

    //btnOkOnPress: () {},
      // btnOkColor: Constants.kMainDarkBlue ,
      // btnOkText: "تأكيد" ,
      // buttonsTextStyle: Constants.mainLightAuthHeader ,
      titleTextStyle: Constants.mainHeader ,
      descTextStyle: Constants.descriptionAuthText

    )..show();
  }
  static Future<AwesomeDialog> errorDialog(BuildContext context, {String? title , message})async{
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: title!,
        headerAnimationLoop: false,
        //customHeader: Image.asset("assets/icons/icons8-home-96.png"),

        desc: '$message',

    btnOkOnPress: () {},
      btnOkColor: Colors.red ,
      btnOkText: "خروج" ,
      buttonsTextStyle: Constants.mainLightAuthHeader ,
      titleTextStyle: Constants.mainHeader ,
      descTextStyle: Constants.descriptionAuthText

    )..show();
  }

}