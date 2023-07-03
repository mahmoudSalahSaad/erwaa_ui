import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';


class OrderType extends StatelessWidget {
  const OrderType({
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
              color: Constants.kMainWhite,
              borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
              boxShadow: [
                BoxShadow(
                  color:  Colors.black.withOpacity(0.1) ,
                  offset: const Offset(0, 0) ,
                  blurRadius: 58 ,
                )
              ]
          ),
          child: Column(
            children: [
              Text("نوع الطلب" ,style: Constants.checkOutHeader,) ,
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/icons8-interaction-96 (1).png" , height: getProportionateScreenHeight(78),) ,
                      SizedBox(
                        height: getProportionateScreenHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle_outlined , color: Constants.kMainBlack,),
                          Text("الطلب لمرة واحدة",style: Constants.cardTitle,)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/icons8-scheduled-delivery-96 (1).png" , height: getProportionateScreenHeight(78),) ,
                      SizedBox(
                        height: getProportionateScreenHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline , color: Constants.kMainDarkBlue,),
                          Text("الطلب لأكثر من مرة",style: Constants.checkOutHeader,)
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}