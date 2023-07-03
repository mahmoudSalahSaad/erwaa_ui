// ignore_for_file: use_build_context_synchronously

import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/widgets/bg_auth.dart';
import 'package:erwaa/views/auth/widgets/main_pass_field.dart';
import 'package:erwaa/views/auth/widgets/main_text_field.dart';
import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResetBody extends StatefulWidget {
  final String? token ;
  const ResetBody({Key? key, this.token}) : super(key: key);

  @override
  State<ResetBody> createState() => _ResetBodyState();
}

class _ResetBodyState extends State<ResetBody> {
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
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final Map<String, dynamic> _formData = {
    'password': null,
    'password_confirmation' : null ,
    'token' : null
  };



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.token);
    _formData['token'] = widget.token ;

  }

  void onSubmit() async {
    onClick();
    setState(() {

    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (!_formKey.currentState!.validate()) {


      onClick();
      return;
    } else {
      _formKey.currentState!.save();

      var result = await userProvider.resetPassword(_formData);
      setState(() {

      });
      if (result['success']) {

        SystemDialogs.dialog(
            context,
            message: result['message'],
            title: "فشلت العملية"
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen()));



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
      child: SizedBox(
        height: SizeConfig.screenHeight! *0.96,
        width: SizeConfig.screenWidth,
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
                  height: getProportionateScreenHeight(300),
                ) ,
                Text("أنشاء كلمة مرور جديدة",style: Constants.mainHeader,) ,
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),


               Form(
                 key: _formKey,
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("كلمة المرور" , style: Constants.mainAuthTextLabel,) ,
                     SizedBox(
                       height: getProportionateScreenHeight(4),
                     ),
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
                         print("validation ");
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
                   ],
                 ) ,
               ) ,
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("تأكيد كلمة المرور" , style: Constants.mainAuthTextLabel,) ,
                    SizedBox(
                      height: getProportionateScreenHeight(4),
                    ),
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
                          print("confirm empty!") ;
                          return 'برجاء ادخال كلمة المرور';
                        }else{
                          if( value.length < 6 ){
                            print("confirm length!") ;
                            return 'كلمة المرور يجب ان تكون 6 حروف او ارقام على الاقل' ;
                          }else{
                            if(_formData["password"] != value){
                              print("password not equal!") ;
                              return 'برجاء ادخال كلمة مرور متطابقة' ;
                            }
                          }
                        }



                        return null ;
                      },
                    ),
                  ],
                ) ,
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    GestureDetector(
                      onTap: (){
                       onSubmit();
                      },
                      child: Container(

                        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                        width : getProportionateScreenWidth(150),
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Constants.kMainDarkBlue ,
                              Constants.kMainDarkBlue
                            ] ,
                                tileMode: TileMode.decal ,
                                focalRadius: 200 ,
                                radius: 100
                            ) ,

                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text("ارسال",style: Constants.mainLightAuthHeader,),
                        ),
                      ),
                    ) ,

                  ],
                ) ,
              ],
            )
          ],
        ),
      ),
    );
  }
}
