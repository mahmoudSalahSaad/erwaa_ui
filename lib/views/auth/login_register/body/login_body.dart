
import 'package:erwaa/contorller/authUIProvider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';

import 'package:erwaa/views/auth/login_register/widgets/login_card.dart';
import 'package:erwaa/views/auth/login_register/widgets/register_card.dart';
import 'package:erwaa/views/auth/widgets/bg_auth.dart';
import 'package:erwaa/views/auth/widgets/main_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String value ='login' ;
  @override
  Widget build(BuildContext context) {
    final authUIProvider = Provider.of<AuthUIProvider>(context , listen: true) ;
    return SingleChildScrollView(
      child: Container(
        // height: SizeConfig.screenHeight!*0.96,
        width: MediaQuery.of(context).size.width,
        color: Constants.kBgColor,
        child:  Stack(
          children: [
            const BgAuth() ,
            SizedBox(

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(14) , vertical: getProportionateScreenHeight(4)),
                            decoration: BoxDecoration(
                                color: Colors.black ,
                            
                                borderRadius: BorderRadius.circular(getProportionateScreenHeight(8))
                            ),
                            child: Text("skip".tr , style: Constants.backText,),
                          )
                        ],
                      ),
                    ) ,

                    SizedBox(
                      height: getProportionateScreenHeight(225),
                    ) ,

                    SizedBox(
                      width: getProportionateScreenWidth(300),
                      child: ToggleSwitch(
                        minWidth: getProportionateScreenWidth(149),
                        minHeight: getProportionateScreenHeight(40),
                        cornerRadius: 15.0,
                        activeBgColors: [[Constants.kMainDarkBlue], [Constants.kMainDarkBlue]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Constants.kMainGray,
                        animate: true,
                        curve: Curves.fastOutSlowIn,
                        initialLabelIndex: authUIProvider.authHeader == 'login' ? 1 : 0,
                        totalSwitches: 2,
                        labels:  [("register".tr), 'sign_in'.tr],
                        customTextStyles: [
                          TextStyle(
                              fontFamily: 'Cairo' ,
                            fontSize: getProportionateScreenHeight(16) ,
                            fontWeight: FontWeight.bold
                          ) ,
                          TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: getProportionateScreenHeight(16) ,
                              fontWeight: FontWeight.bold
                          ) ,
                        ],
                        radiusStyle: true,
                        onToggle: (index) {
                          if(index!.isOdd){

                            value =  'login'  ;
                            authUIProvider.setAuthHeader = 'login' ;

                          }else{
                            value = 'register' ;
                            authUIProvider.setAuthHeader = 'register' ;

                          }
                        },
                      ),
                    ) ,


                    Consumer<AuthUIProvider>(builder: (_,value,__){
                      return value.authHeader == "login" ?

                      LoginCard()

                          : RegisterCard() ;
                    } , ) ,

                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}








