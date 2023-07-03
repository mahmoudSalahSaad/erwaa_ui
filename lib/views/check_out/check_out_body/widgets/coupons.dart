import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';



class Coupons extends StatelessWidget {
  const Coupons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Directionality(textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(10)),
            decoration: BoxDecoration(
                color: Constants.kMainWhite ,
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1) ,
                      offset: const Offset(0  , 0),
                      blurRadius: 58
                  )
                ]
            ),
            child: Column(
              children: [
                Text("قسائم الشراء",style: Constants.checkOutHeader,) ,
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ) ,
                Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Constants.kMainLightGray ,
                        filled: true ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                          borderSide: const BorderSide(
                              color: Colors.transparent
                          ),


                        ) ,

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                          borderSide: const BorderSide(
                              color: Colors.transparent
                          ),


                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                          borderSide: const BorderSide(
                              color: Colors.transparent
                          ),


                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                          borderSide: const BorderSide(
                              color: Colors.transparent
                          ),



                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12) , vertical: getProportionateScreenHeight(8)),
                        hintText: "أضف قسيمة شراء",
                        hintStyle: Constants.mainAuthTextLabel,
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(vertical: 8 , horizontal: getProportionateScreenWidth(10)),
                          width: getProportionateScreenWidth(70),
                          padding: EdgeInsets.all(getProportionateScreenHeight(6)),
                          decoration: BoxDecoration(
                              color: Constants.kMainDarkBlue ,
                              borderRadius: BorderRadius.circular(getProportionateScreenHeight(8))
                          ),
                          child: Center(
                            child: Text("أضف",style: Constants.mainLightAuthHeader,),
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}