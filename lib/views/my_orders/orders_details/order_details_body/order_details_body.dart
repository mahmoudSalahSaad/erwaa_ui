import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../../../utils/time_line.dart';





class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({Key? key}) : super(key: key);

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(
            isBack: true,
            title: "تفاصيل الطلب",
            onPress: ()=> Navigator.of(context).pop(),
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ) ,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(20)),
              decoration: BoxDecoration(
                  color: Constants.kMainDarkBlue ,
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1)  ,
                        blurRadius: 58 ,
                        offset: const Offset(0, 0)
                    )
                  ]
              ),
              child:Column(
                children: [
                  Directionality(textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("طلبكم رقم #123456" ,style: Constants.homeHeader,) ,
                          Text("49.4 ر.س" ,style: Constants.homeHeader,) ,
                        ],
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Directionality(textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("4منتج-توصيل الي المساجد" ,style: Constants.mainLightAuthHeader,) ,

                        ],
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Directionality(textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("بتاريخ  29-5-2023" ,style: Constants.mainLightAuthHeader,) ,

                        ],
                      )),
                ],
              ),
            ),
          )   ,

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          Column(
            children: List.generate(4, (index) =>  Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
              child: Container(
                margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                decoration: BoxDecoration(
                    color: Constants.kMainWhite ,
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1) ,
                          offset: const Offset(0, 0) ,
                          blurRadius: 58
                      )
                    ]
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [

                      Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)) ,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Image.asset("assets/images/download.jpeg",width: getProportionateScreenWidth(80),) ,
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("مياة شرب ماركة افيان",style: Constants.cardTitle,),
                                  Text("(كرتونة-24 قارورة)" , style: Constants.cardDescription,),
                                  Text("المسجد النبوي" , style: Constants.cardDescription,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ) ,
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ) ,
                      Container(
                        // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                        decoration: BoxDecoration(
                            color: Constants.kMainWhite,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(getProportionateScreenHeight(15)) , bottomLeft: Radius.circular(getProportionateScreenHeight(15))) ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1) ,
                                offset: const Offset(0, 0) ,
                                blurRadius: 58 ,

                              )
                            ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(150),
                              width: getProportionateScreenWidth(150),
                              child: Timeline(
                                gutterSpacing: 10,
                                indicators:  <Widget>[
                                  Icon(Icons.alarm , color:  Constants.kMainDarkBlue,),
                                  Icon(Icons.downloading_rounded, color:  Constants.kMainDarkBlue,),
                                  Icon(Icons.delivery_dining_rounded, color:  Constants.kMainDarkBlue,),
                                  Icon(Icons.home, color:  Constants.kMainGray,),
                                ],
                                children: <Widget>[
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    child: Text("معلق",style: Constants.activeTimeLine,),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(150),

                                    child: Text("قيد التجهيز",style: Constants.activeTimeLine,),
                                  ),
                                  Text("قيد التوصيل",style: Constants.activeTimeLine,),
                                  Text("تم التوصيل",style: Constants.homeMainText,),

                                ],
                              ),
                            ) ,
                            SizedBox(
                              height: getProportionateScreenHeight(150),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text("25-6-2023", style: Constants.activeTimeLine,),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text("25-6-2023", style: Constants.activeTimeLine,),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text("25-6-2023", style: Constants.activeTimeLine,),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text("لم تتم بعد", style: Constants.homeMainText,),

                                ],
                              ),
                            )
                          ],
                        ),
                      )

                    ],
                  ),

                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
