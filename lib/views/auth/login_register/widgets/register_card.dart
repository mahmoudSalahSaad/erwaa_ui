// ignore_for_file: use_build_context_synchronously

import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/verify/verify_screen.dart';
import 'package:erwaa/views/auth/widgets/main_pass_field.dart';
import 'package:erwaa/views/auth/widgets/main_phone_text_field.dart';
import 'package:erwaa/views/auth/widgets/main_text_field.dart';
import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';



class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
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
  final TextEditingController _firstName = TextEditingController() ;
  final TextEditingController _lastName = TextEditingController() ;
  final TextEditingController _mobile = TextEditingController() ;
  final TextEditingController _password = TextEditingController() ;
  final TextEditingController _confirmPassword = TextEditingController() ;
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    "password_confirmation" : null ,
    'mobile': '',
    'first_name' : null ,
    "last_name" : null,
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
        _confirmPassword.clear();
      }

      onClick() ;
      return;
    }else{
      _formKey.currentState!.save();

      var result = await userProvider.register(_formData );
      setState(() {

      });
      if (result['success']) {


        Navigator.push(context, MaterialPageRoute(builder: (_)=> const VerifyScreen()));

        // SystemDialogs.dialog(
        //   context ,
        //   title: "نجاح" ,
        //   message: "تم نسجيل حساب جديد بنجاح"
        // );

      } else {


        SystemDialogs. errorDialog(
            context ,
          message: result['message'] ,
          title: "فشلت العملية"
        ) ;

      }
      _password.clear() ;
      _confirmPassword.clear() ;
      onClick() ;
    }


  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context , listen: true) ;
    return SizedBox(
      width: getProportionateScreenWidth(300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Form(
              key: _formKey,
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text("last_name".tr,style: Constants.mainAuthTextLabel,) ,
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ) ,

                       MainTextField(
                        hint: "",
                        controller: _lastName,
                         onSave: (String? value){
                          _formData["last_name"] = value ;
                         },
                         onChange: (String? value){
                          _formData['last_name'] = value ;
                         },
                         onValidate: (String? value){
                          if(value == null){
                            return "برجاء ادخال اسم العائلة" ;
                          }else{
                            if(value.isEmpty){
                              return "برجاء ادخال اسم العائلة" ;
                            }
                          }
                          return null ;
                         },

                      ) ,
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text("first_name".tr,style: Constants.mainAuthTextLabel,) ,

                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ) ,

                       MainTextField(
                        hint: "",
                        controller: _firstName,
                         onSave: (String? value){
                           _formData["first_name"] = value ;
                         },
                         onChange: (String? value){
                           _formData['first_name'] = value ;
                         },
                         onValidate: (String? value){
                           if(value == null){
                             return "برجاء ادخال الاسم الاول" ;
                           }else{
                             if(value.isEmpty){
                               return "برجاء ادخال الاسم الاول" ;
                             }
                           }
                           return null ;
                         },

                      ) ,

                    ],
                  ),

                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("mobile".tr,style: Constants.mainAuthTextLabel,) ,


                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(4),
              ) ,

              MainPhoneTextField(
               controller: _mobile,
                onSave: (PhoneNumber? value){
                  // print('mobile save');
                  if( value!.number.isNotEmpty){
                    _formData['mobile'] = value.number ;
                    _formData['code'] = value.countryCode;
                  }else{
                    _formData['mobile'] = 'notvalide' ;
                  }
                },




                validate: (PhoneNumber? value){
                //   print('mobile save');
                  if(value!.number.isNotEmpty){
                    _formData['mobile'] = value.number ;
                    _formData['code'] = value.countryCode;
                  }else{
                    _formData['mobile'] = 'notvalide' ;
                  }

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
                controller: _password,
                onSave: (String? value){
                  _formData['password'] = value ;
                },
                onChange: (String? value){
                  _formData['password'] = value ;
                },
                onValidate: (String? value){

                    if( value!.isEmpty){

                      return 'برجاء ادخال كلمة المرور';
                    }else{
                      if( value.length < 6 ){

                        return 'كلمة المرور يجب ان تكون 6 حروف او ارقام على الاقل' ;
                      }
                    }


                    return null ;
                },


              ),


              SizedBox(
                height: getProportionateScreenHeight(10),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("confirm_password".tr,style: Constants.mainAuthTextLabel,) ,


                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(4),
              ) ,

              MainPassField(
                obscure: true,
                width: getProportionateScreenWidth(300),
                controller: _confirmPassword,
                onSave: (String? value){
                  _formData['password_confirmation'] = value ;
                },
                onChange: (String? value){
                  _formData['password_confirmation'] = value ;
                },
                onValidate: (String? value){
                  if( value!.isEmpty){

                    return 'برجاء ادخال كلمة المرور';
                  }else{
                    if( value.length < 6 ){

                      return 'كلمة المرور يجب ان تكون 6 حروف او ارقام على الاقل' ;
                    }else{
                      if(_formData["password"] != value){

                        return 'برجاء ادخال كلمة مرور متطابقة' ;
                      }
                    }
                  }



                  return null ;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),


            ],
          )),

          SizedBox(
            height: getProportionateScreenHeight(10),
          ),

          //
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("تأكيد كلمة المرور",style: Constants.mainAuthTextLabel,) ,
          //
          //
          //   ],
          // ),
          // SizedBox(
          //   height: getProportionateScreenHeight(4),
          // ) ,
          //
          // MainPassField(
          //   obscure: true,
          //   width: getProportionateScreenWidth(300),
          //   controller: _confirmPassword,
          //   onSave: (String? value){
          //     _formData['password'] = value ;
          //   },
          //   onChange: (String? value){
          //     _formData['password'] = value ;
          //   },
          //   onValidate: (String? value){
          //     if( value!.isEmpty){
          //       print("confirm empty!") ;
          //       return 'برجاء ادخال كلمة المرور';
          //     }else{
          //       if( value.length < 6 ){
          //         print("confirm length!") ;
          //         return 'كلمة المرور يجب ان تكون 6 حروف او ارقام على الاقل' ;
          //       }else{
          //         if(_formData["password"] != value){
          //           print("password not equal!") ;
          //           return 'برجاء ادخال كلمة مرور متطابقة' ;
          //         }
          //       }
          //     }
          //
          //
          //
          //     return null ;
          //   },
          // ),
          // SizedBox(
          //   height: getProportionateScreenHeight(10),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              userProvider.isLoading == false ?
              GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen())) ;
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
                    child: Text("register".tr,style: Constants.mainLightAuthHeader,),
                  ),
                ),
              ) : LoadingAnimationWidget.newtonCradle(color: Constants.kMainDarkBlue, size: getProportionateScreenHeight(100)) ,
            ],
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(16),
          )







        ],
      ),
    );
  }
}
