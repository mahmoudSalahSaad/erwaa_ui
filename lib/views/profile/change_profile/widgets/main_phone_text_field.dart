import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class MainPhoneTextFieldUpdated extends StatelessWidget {
  MainPhoneTextFieldUpdated({super.key, this.phoneNumb});
  ///////// change: add and recieve var for phone number
  String? phoneNumb;
  ///////// change: add and recieve var for phone number
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      height: getProportionateScreenHeight(40),
      // padding : EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          color: Constants.kMainWhite,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 3),
                blurRadius: 58)
          ]),
      child: IntlPhoneField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: phoneNumb ?? '0xxxxxxxx',
            hintStyle: TextStyle(
                color: Constants.kMainGray,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(13))),
        disableLengthCheck: true,
        initialCountryCode: "SA",
      ),
    );
  }
}
