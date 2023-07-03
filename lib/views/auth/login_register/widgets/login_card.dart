// ignore_for_file: use_build_context_synchronously

import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/forget%20password/forget_password_screen.dart';
import 'package:erwaa/views/auth/verify/verify_screen.dart';
import 'package:erwaa/views/auth/widgets/main_pass_field.dart';
import 'package:erwaa/views/auth/widgets/main_phone_text_field.dart';
import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';




class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
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
  final TextEditingController _mobile = TextEditingController() ;
  final TextEditingController _password = TextEditingController() ;
  final Map<String, dynamic> _formData = {
    'password': null,
    'mobile': '',
  };

  void onSubmit() async {
    onClick() ;
    setState(() {

    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (!_formKey.currentState!.validate() ) {
      if(_formData['mobile'] == ''){
        _formData['mobile'] = 'notvalide' ;
        _password.clear();
      }

      onClick() ;
      return;
    }else{
      _formKey.currentState!.save();

      var result = await userProvider.login(_formData );
      setState(() {

      });
      if (result['success']) {
        if(result['message'] == "not-verified"){

          Navigator.push(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));
          SystemDialogs. dialog(
              context ,
              message: "برجاء تفعيل الحساب الخاص بكض" ,
              title: "تحزير"
          ) ;
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen())) ;

        }


        // SystemDialogs.dialog(
        //   context ,
        //   title: "نجاح" ,
        //   message: "تم نسجيل حساب جديد بنجاح"
        // );

      } else {

        if(result['message'] == "not-verified"){

          Navigator.push(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));
          SystemDialogs. dialog(
              context ,
              message: "برجاء تفعيل الحساب الخاص بكض" ,
              title: "تحزير"
          ) ;
        }else{
          SystemDialogs. errorDialog(
              context ,
              message: result['message'] ,
              title: "فشلت العملية"
          ) ;
        }


      }
      _password.clear() ;

      onClick() ;
    }


  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context , listen: true) ;
    return SizedBox(
      width: getProportionateScreenWidth(300),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(23),
            ),
            Text("mobile".tr,style: Constants.mainAuthTextLabel,) ,

            MainPhoneTextField(
              controller: _mobile,
              validate: (PhoneNumber? value){
                _formData['mobile'] = value!.number ;
                _formData['code'] = value.countryCode ;
              },
              onSave: (PhoneNumber? value){
                _formData['mobile'] = value!.number ;
                _formData['code'] = value.countryCode ;
              },
            ) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                _formData['mobile']  == 'notvalide'?  Text("رجاء الدخال رقم الهاتف" , style: Constants.errorText,) :
                const SizedBox() ,
                SizedBox(
                  width: getProportionateScreenWidth(8),
                ),
              ],
            ),

            SizedBox(
              height: getProportionateScreenHeight(10),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("password".tr,style: Constants.mainAuthTextLabel,) ,


              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ) ,

            MainPassField(
              obscure: true,
              width: getProportionateScreenWidth(300),
              onSave: (String? value){
                _formData['password'] = value ;
              },
              onChange: (String? value){
                _formData['password'] = value ;
              },
              controller: _password,
              onValidate: (String? value){
                if( value!.isEmpty){
                  print("password empty!") ;
                  return 'برجاء ادخال كلمة المرور';
                }else{
                  if( value.length < 6 ){
                    print("password length!") ;
                    return 'كلمة المرور يجب ان تكون 6 حروف او ارقام على الاقل' ;
                  }
                }

                print("valid");

                return null ;
              },

            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen()));
                  },
                  child: Text("forget_password_Q".tr  , style: Constants.smallAuthText,),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
               userProvider.isLoading == false ? 
               GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>const VerifyScreen())) ;
                    onSubmit();
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
                      child: Text("sign_in".tr,style: Constants.mainLightAuthHeader,),
                    ),
                  ),
                )  : 
                LoadingAnimationWidget.newtonCradle(color: Constants.kMainDarkBlue, size: getProportionateScreenHeight(100)),

              ],
            ) ,
            SizedBox(
              height: getProportionateScreenHeight(10),
            ) ,


          ],
        ),
      ),
    );
  }
}
