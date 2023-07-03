import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';



class OrderNotes extends StatelessWidget {
  const OrderNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(10)),
          decoration: BoxDecoration(
              color: Constants.kMainWhite ,
              borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1) ,
                    blurRadius: 58 ,
                    offset: const Offset(0, 0)
                )
              ]
          ),
          child: Column(
            children: [
              Text("ملاحظات على الطلب",style: Constants.checkOutHeader,) ,
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12) , vertical: getProportionateScreenHeight(10)),
                      hintText: "أضف ملاحظتك",
                      hintStyle: Constants.mainAuthTextLabel

                  ),
                  maxLines: 6,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
