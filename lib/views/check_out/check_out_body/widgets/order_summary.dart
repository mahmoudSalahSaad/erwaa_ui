import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/dashed_line.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';


class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            color: Constants.kMainWhite ,
            borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1) ,
                blurRadius: 58 ,
                offset: const Offset(0  , 0) ,
              )
            ]
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Text("ملخص الطلب" ,style: Constants.checkOutHeader,) ,
              SizedBox(
                height: getProportionateScreenHeight(10),
              ) ,
              Column(
                children: List.generate(2, (index) => Container(
                    padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                    margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                    decoration: BoxDecoration(
                        color: Constants.kMainWhite ,
                        borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 0) ,
                              blurRadius: 58
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/download.jpeg" , width: getProportionateScreenWidth(80),) ,

                            SizedBox(
                              width: getProportionateScreenWidth(170),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("مياة شرب ماركة افيان",style: Constants.cardTitle,),
                                  Text("(كرتونة-24 قارورة)",style: Constants.cardDescription,),
                                  Text("المسجد النبوي",style: Constants.cardDescription,),
                                  Text("المسجد النبوي",style: Constants.cardDescription,),
                                  Text("المسجد النبوي",style: Constants.cardDescription,),
                                ],
                              ),
                            ) ,
                            SizedBox(
                              width: getProportionateScreenWidth(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width : getProportionateScreenHeight(30),
                                    height: getProportionateScreenHeight(30),
                                    decoration: BoxDecoration(
                                      color: Constants.kMainDarkBlue ,
                                      borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add , color:  Constants.kMainWhite,),

                                    ),
                                  ) ,
                                  Text("20" ,style: Constants.smallAuthText, ),
                                  Container(
                                    width : getProportionateScreenHeight(30),
                                    height: getProportionateScreenHeight(30),
                                    decoration: BoxDecoration(
                                      color: Colors.red ,
                                      borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.remove , color:  Constants.kMainWhite,),

                                    ),
                                  ) ,
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("49.8 ر.س" , style: Constants.cardCostText,),
                          ],
                        )
                      ],
                    )

                )),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ) ,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                child: const DashLineView(
                  fillRate: 0.7,
                  direction: Axis.horizontal,
                ),
              ) ,
              SizedBox(
                height: getProportionateScreenHeight(10),
              ) ,
              Text("تفاصيل السعر" ,style: Constants.checkOutHeader,) ,

              SizedBox(
                height: getProportionateScreenHeight(10),
              ) ,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("أجمالي الطلب" , style: Constants.cardTitle,) ,
                        Text("48.4 ر.س",style: Constants.cardTitle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("سعر التوصيل" , style: Constants.cardTitle,) ,
                        Text("6.4 ر.س",style: Constants.cardTitle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ضريبة(15%)" , style: Constants.cardTitle,) ,
                        Text("5.4 ر.س",style: Constants.cardTitle,),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Constants.kMainDarkBlue ,
                          borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)) ,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 0) ,
                                blurRadius: 58
                            )
                          ]
                      ),


                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الاجمالي" , style: Constants.mainLightAuthHeader,) ,
                            Text("99.6 ر.س" , style: Constants.mainLightAuthHeader,) ,
                          ],
                        ),
                      ),
                    ) ,

                    SizedBox(
                      height: getProportionateScreenHeight(6),
                    )
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}