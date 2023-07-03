
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class MainPhoneTextField extends StatelessWidget {
  final Function(PhoneNumber?)? onSave ;
  final Function(PhoneNumber?)? validate ;
  final TextEditingController? controller;

  const MainPhoneTextField({
    super.key, this.onSave, this.controller, this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      // height: getProportionateScreenHeight(40),
      // padding : EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15) ,
                offset: const Offset(0, 3) ,
                blurRadius: 58
            )
          ]
      ),
      child: IntlPhoneField(
        controller: controller,

        onChanged: (value) => validate!(value),
        decoration:  InputDecoration(
            border: InputBorder.none ,
            hintText: '0xxxxxxxx' ,
            filled: true,
            fillColor: Constants.kMainWhite,
            contentPadding: EdgeInsets.symmetric(vertical:0 ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                borderSide: const BorderSide(color: Colors.transparent)
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                borderSide: const BorderSide(color: Colors.transparent)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                borderSide: const BorderSide(color: Colors.transparent)
            ),

            hintStyle:  TextStyle(
              color: Constants.kMainGray,
              fontFamily: 'Cairo' ,
              fontWeight: FontWeight.bold ,
              height: 1.4,
              fontSize: getProportionateScreenHeight(16)
            )
        ),
        disableLengthCheck: true,
        initialCountryCode: "SA",
        onSaved: (value) => onSave!(value),
      ),
    );
  }
}

