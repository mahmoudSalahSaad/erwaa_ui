// ignore_for_file: use_build_context_synchronously

import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/reset_password_screen/reset_password_screen.dart';
import 'package:erwaa/views/auth/verify/verify_screen.dart';
import 'package:erwaa/views/auth/widgets/bg_auth.dart';
import 'package:erwaa/views/auth/widgets/main_phone_text_field.dart';
import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';



class ForgetBody extends StatefulWidget {
  const ForgetBody({Key? key}) : super(key: key);

  @override
  State<ForgetBody> createState() => _ForgetBodyState();
}

class _ForgetBodyState extends State<ForgetBody> {

  var onclick = false;

  void onClick() {
    if (onclick == false) {
      setState(() {
        onclick = true;
      });
    } else {
      setState(() {
        onclick = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobile = TextEditingController();

  final Map<String, dynamic> _formData = {
    'mobile': '',
  };

  void onSubmit() async {
    onClick();
    setState(() {

    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (!_formKey.currentState!.validate()) {
      if (_formData['mobile'] == '') {
        _formData['mobile'] = 'notvalide';
      }

      onClick();
      return;
    } else {
      _formKey.currentState!.save();

      var result = await userProvider.forgetPassword(_formData);
      setState(() {

      });
      if (result['success']) {

        SystemDialogs.dialog(
            context,
            message: result['message'],
            title: "فشلت العملية"
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> VerifyScreen(
          mobile: _formData['mobile'],
          code: _formData['mobile_code'],
          type: "forget_password",
        )));


      }else{
        SystemDialogs.errorDialog(
            context,
            message: result['message'],
            title: "فشلت العملية"
        );
      }
    }


        onClick();
      }
      @override
      Widget build(BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight! * 0.95,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Constants.kBgColor,
            child: Stack(
              children: [
                BgAuth(
                  height: getProportionateScreenHeight(600),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(28),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(14),
                                vertical: getProportionateScreenHeight(4)),
                            decoration: BoxDecoration(
                                color: Colors.black,

                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(8))
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded, color: Constants
                                .kMainWhite, size: getProportionateScreenHeight(
                                30),),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(300),
                    ),
                    Text("forget_password_T".tr, style: Constants.mainHeader,),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(300),
                      child: Text(
                          "forget_password_description".tr,
                          style: Constants.descriptionAuthText,
                          textAlign: TextAlign.center),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),

                  Form(
                    key: _formKey,
                    child: MainPhoneTextField(
                      controller: _mobile,
                      onSave: (PhoneNumber? value) {
                        _formData['mobile_code'] = value!.countryCode  ;
                        _formData['mobile'] = value.number ;
                      },
                      validate: (PhoneNumber? value) {
                        _formData['mobile_code'] = value!.countryCode  ;
                        _formData['mobile'] = value.number ;
                      },

                    ),
                  ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        _formData['mobile'] == 'notvalide'
                            ? Text(
                          "رجاء الدخال رقم الهاتف", style: Constants.errorText,)
                            :
                        const SizedBox(),
                        SizedBox(
                          width: getProportionateScreenWidth(8),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        GestureDetector(
                          onTap: () {
                            onSubmit() ;
                          },
                          child: Container(

                            padding: EdgeInsets.all(
                                getProportionateScreenHeight(
                                    10)),
                            width: getProportionateScreenWidth(150),
                            decoration: BoxDecoration(
                                gradient: RadialGradient(colors: [
                                  Constants.kMainDarkBlue,
                                  Constants.kMainDarkBlue
                                ],
                                    tileMode: TileMode.decal,
                                    focalRadius: 200,
                                    radius: 100
                                ),

                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text(
                                "send".tr, style: Constants.mainLightAuthHeader,),
                            ),
                          ),
                        ),

                      ],
                    ),


                  ],
                )
              ],
            ),
          ),
        );
      }
    }

