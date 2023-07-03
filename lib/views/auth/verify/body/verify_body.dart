// ignore_for_file: use_build_context_synchronously

import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/main.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/reset_password_screen/reset_password_screen.dart';
import 'package:erwaa/views/auth/verify/verify_screen.dart';
import 'package:erwaa/views/auth/widgets/bg_auth.dart';
import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';


class VerifyBody extends StatefulWidget {
    final String? type ;
    final String? code ;
    final String? mobile ;
  const VerifyBody({Key? key, this.type, this.code, this.mobile}) : super(key: key);

  @override
  State<VerifyBody> createState() => _VerifyBodyState();
}

class _VerifyBodyState extends State<VerifyBody> {
  String code = '' ;
  bool isFinshed = false ;
  var onclick = false;
  void onClick(){
    if(onclick == false){
      setState(() {
        onclick = true ;
      });
    }else{
      setState(() {
        onclick = false  ;
      });
    }
  }
  final _formKey = GlobalKey<FormState>();

  // final Map<String, dynamic> _formData = {
  //   'password': null,
  //   'mobile': '',
  // };

  void onSubmit() async {
    onClick() ;
    setState(() {

    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (!_formKey.currentState!.validate() ) {


      onClick() ;
      return;
    }else{
      _formKey.currentState!.save();
      late Map<String, dynamic> result ;
      if(widget.type == "register"){
         result = await userProvider.verify({'verification_code' : code} );
      }else{
        result = await userProvider.verifyForgetPassword({
          "mobile_code": widget.code ,
          "mobile" : widget.mobile ,
          "code" : code
        } );
      }

      setState(() {

      });
      if (result['success']) {
        if(widget.type == "register"){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen())) ;

        }else{
          print(result['token']);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> ResetPasswordScreen(
            token: result['token'],
          ))) ;
        }

        // SystemDialogs.dialog(
        //   context ,
        //   title: "نجاح" ,
        //   message: "تم نسجيل حساب جديد بنجاح"
        // );

      } else {

        if(result['message'] == "not-verified"){

          // Navigator.push(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));
          // SystemDialogs. dialog(
          //     context ,
          //     message: "برجاء تفعيل الحساب الخاص بكض" ,
          //     title: "تحزير"
          // ) ;
        }else{
          SystemDialogs. errorDialog(
              context ,
              message: result['message'] ,
              title: "فشلت العملية"
          ) ;
        }


      }


      onClick() ;
    }


  }
   resend() async {
    onClick() ;
    setState(() {

    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (!_formKey.currentState!.validate() ) {


      onClick() ;
      return;
    }else{
      _formKey.currentState!.save();

      var result = await userProvider.resend({
        'code' : userProvider.user!.code ,
        'mobile' : userProvider.user!.mobile ,
        'type' : 'register'
      } );
      setState(() {

      });
      if (result['success']) {

        // Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen())) ;
        if(widget.type == 'regiter'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));

        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>  VerifyScreen(
            type: "forget_password",
            code: widget.code,
            mobile: widget.mobile,
          )));
        }

        // SystemDialogs.dialog(
        //   context ,
        //   title: "نجاح" ,
        //   message: "تم نسجيل حساب جديد بنجاح"
        // );

      } else {

        if(result['message'] == "not-verified"){

          // Navigator.push(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));
          // SystemDialogs. dialog(
          //     context ,
          //     message: "برجاء تفعيل الحساب الخاص بكض" ,
          //     title: "تحزير"
          // ) ;
        }else{
          SystemDialogs. errorDialog(
              context ,
              message: result['message'] ,
              title: "فشلت العملية"
          ) ;
        }


      }


      onClick() ;
    }


  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context ,listen: true) ;
    return SingleChildScrollView(
      child: Container(

        width: MediaQuery.of(context).size.width,
        color: Constants.kBgColor,
        child: Stack(
          children: [
             BgAuth(
              height: getProportionateScreenHeight(600),
            ) ,
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
                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(14), vertical: getProportionateScreenHeight(4)),
                        decoration: BoxDecoration(
                            color: Colors.black  ,

                            borderRadius: BorderRadius.circular(getProportionateScreenHeight(8))
                        ),
                        child: Icon(Icons.arrow_forward_ios_rounded , color: Constants.kMainWhite,size: getProportionateScreenHeight(30),),
                      )
                    ],
                  ),
                ) ,

                SizedBox(
                  height: getProportionateScreenHeight(320),
                ) ,
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("account confirmation".tr,style: Constants.mainHeader,),


                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ) ,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("account confirmation_D".tr,style: Constants.descriptionAuthPinCodeText,),
                    Text("${widget.type == "register" ? userProvider.user!.code : widget.code} ${widget.type == "register" ?userProvider.user!.mobile : widget.mobile}",style: Constants.descriptionAuthPinCodeText,),

                  ],
                ),

                Form(
                  key:  _formKey,
                  child: SizedBox(
                    height: getProportionateScreenHeight(100),
                    child:   OtpTextField(
                      numberOfFields: 5,


                      borderColor: Colors.transparent,
                      focusedBorderColor: Constants.kMainDarkBlue,
                      fillColor:Constants.kMainWhite,
                      enabledBorderColor: Colors.transparent,
                      filled: true,
                      fieldWidth: getProportionateScreenWidth(60),
                      borderRadius: BorderRadius.circular(15),

                      styles:const [
                        TextStyle(
                            color: Colors.black ,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24
                        ),
                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24

                        ),
                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24
                        ),
                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24
                        ),
                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24
                        ),


                      ],
                      showFieldAsBox: true,
                      clearText: true,
                      borderWidth: 4.0,

                      //runs when a code is typed in
                      onCodeChanged: (String code) {


                        //handle validation or checks here if necessary
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        code = verificationCode ;
                      },
                    ),

                  ) ,
                ),


                userProvider.isLoading == false ? 
                GestureDetector(
                  onTap: (){

                    onSubmit();
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>const VerifyScreen())) ;
                  },
                  child: Container(

                    padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                    width : getProportionateScreenWidth(150),
                    decoration: BoxDecoration(
                        gradient: RadialGradient(colors: [
                          Constants.kMainDarkBlue ,
                          Constants.kMainGray
                        ] ,
                            tileMode: TileMode.decal ,
                            focalRadius: 200 ,
                            radius: 100
                        ) ,

                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("confirm".tr,style: Constants.mainLightAuthHeader,),
                    ),
                  ),
                ) : LoadingAnimationWidget.newtonCradle(color: Constants.kMainDarkBlue, size: getProportionateScreenHeight(100)) ,
               SizedBox(
                 height: getProportionateScreenHeight(10),
               ),

               !isFinshed ?
               Directionality(textDirection: TextDirection.rtl, child:  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(sharedPref.getString("lang") == "ar" ? "ستصلك رسالة في خلال" : "message will be sent in",style: Constants.descriptionAuthText,) ,
                   Countdown(
                     seconds: 60,
                     build: (BuildContext context, double time) => Text(" ${time.toStringAsFixed(0)} ",style: Constants.smallDarkAuthCounterText,),
                     interval: const Duration(milliseconds: 100),
                     onFinished: () {
                        setState(() {
                            isFinshed = true ;
                        });
                     },
                   ),
                   Text(sharedPref.getString("lang") == "ar" ? "ثانية" : "minutes",style: Constants.descriptionAuthText,) ,
                 ],
               ))
                   :  Directionality(textDirection: TextDirection.rtl, child:  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(sharedPref.getString("lang")=="ar"?"لأعادة ارسال الكود" : "to resend code",style: Constants.descriptionAuthText,) ,

                   GestureDetector(
                     onTap: ()async{
                       await resend();
                     },
                     child: Text(sharedPref.getString("lang")=="ar"?"اضغط هنا" : "Click here",style: Constants.checkOutHeader,) ,
                   )
                 ],
               ))

              ],
            )
          ],
        ),
      ),
    );
  }
}
