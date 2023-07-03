import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';
import 'widgets/coupons.dart';
import 'widgets/order_notes.dart';
import 'widgets/order_summary.dart';
import 'widgets/order_time.dart';
import 'widgets/order_type.dart';


class CheckOutBody extends StatefulWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(
            title: "الدفع",
            isBack: true,
            onPress: (){
              Navigator.pop(context);
            },
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,
          const OrderSummary() ,
          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,
          const OrderType(),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,
          
          const OrderTime(),


          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,


          const OrderNotes(),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,

          const Coupons(),


          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,
          
          
          const PaymentWay(),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ) ,


          Container(
            width: getProportionateScreenWidth(340),
            padding: EdgeInsets.all(getProportionateScreenHeight(10)),
            decoration: BoxDecoration(
              color: Constants.kMainDarkBlue ,
              borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1) ,
                  blurRadius: 58 ,
                  offset: const Offset(0, 0),
                )
              ]
            ),
            child: Center(
              child: Text("الدفع" ,style: Constants.homeHeader,),
            ),
          ) , 
          SizedBox(
            height: getProportionateScreenHeight(16),
          )



        ],
      ),
    );
  }
}

class PaymentWay extends StatelessWidget {
  const PaymentWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child:  Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(10)),
          decoration: BoxDecoration(
            color: Constants.kMainWhite ,
            borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1) ,
                offset: const Offset(0, 0) ,
                blurRadius: 58 ,
              )
            ]
          ),
          child: Column(
            children: [
              Text("طريقة الدفع",style: Constants.checkOutHeader,) ,
              SizedBox(
                height: getProportionateScreenHeight(10),
              ) ,
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/icons8-visa-card-96.png" , height: getProportionateScreenHeight(30),),
                          SizedBox(
                            width: getProportionateScreenWidth(8),
                          ),
                          Text("الدفع اونلاين",style: Constants.checkOutHeader,)
                        ],
                      ) ,
                      Icon(Icons.check_circle_outline , color: Constants.kMainDarkBlue,size: getProportionateScreenHeight(20),),
                    ],
                  ) ,
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/icons8-apple-pay-96 (1).png" , height: getProportionateScreenHeight(30),),
                          SizedBox(
                            width: getProportionateScreenWidth(8),
                          ),
                          Text("الدفع عن طريق أبل باي",style: Constants.mainAuthTextLabel,)
                        ],
                      ) ,
                      Icon(Icons.circle_outlined , color: Constants.kMainBlack,size: getProportionateScreenHeight(20),),
                    ],
                  ) ,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}









