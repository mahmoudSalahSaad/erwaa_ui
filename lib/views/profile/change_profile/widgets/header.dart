import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/check_out/check_out_screen.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String? title ;
  final bool? isBack ;
  final Function? onPress ;

  const HomeHeader({
    super.key, this.title, this.isBack, this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          color: Constants.kMainDarkBlue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(getProportionateScreenHeight(10)) , bottomLeft: Radius.circular(getProportionateScreenHeight(10)))
      ),
      child: Directionality(textDirection: TextDirection.rtl, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBack! ?GestureDetector(
            onTap: ()=> onPress!(),
            child:const Directionality(textDirection: TextDirection.ltr
                , child: Icon(Icons.arrow_forward_ios_outlined , color: Colors.white,size: 30,)),
          ) :  SizedBox(width: getProportionateScreenWidth(040),),
          Text(title??"هلا, محمود صلاح" , style: Constants.homeHeader,) ,

          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                      minWidth: getProportionateScreenWidth(300) ,
                      maxWidth: getProportionateScreenWidth(350)
                  ),
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(topRight: Radius.circular(getProportionateScreenHeight(16)), topLeft: Radius.circular(getProportionateScreenHeight(16)))
                  ),
                  builder: (_){
                    return SizedBox(
                      height: getProportionateScreenHeight(600),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(bottom: getProportionateScreenHeight(130)),
                              child: Container(
                                padding: EdgeInsets.all(getProportionateScreenHeight(20)),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(4, (index) => const CartCards()),
                                ),
                              ),
                            ),
                          ) ,
                          Align(
                            alignment: Alignment.bottomCenter,
                            child:
                            Container(
                              height : getProportionateScreenHeight(140),
                              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                              decoration: BoxDecoration(
                                color: Constants.kMainWhite ,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Constants.kMainGray ,
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
                                          Text("16.4 ر.س" , style: Constants.mainLightAuthHeader,) ,
                                        ],
                                      ),
                                    ),
                                  ) ,
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ) ,
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const CheckOutScreen() ));
                                    },
                                    child: Container(
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
                                      child: Center(
                                        child: Text("تأكيد الطلب",style: Constants.mainLightAuthHeader,),
                                      ),
                                    ),
                                  ) ,

                                ],
                              ),
                            ),

                          )
                        ],
                      ),
                    );
                  });
            },
            child: SizedBox(
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenHeight(50),
              child: Stack(

                children: [


                  Align(
                    alignment: Alignment.center,
                    child:  Image.asset("assets/icons/icons8-cart-96.png", height: 30,),
                  ),
                  Positioned(
                    top: 2,
                    right: 1,
                    child: Container(
                      height: getProportionateScreenHeight(20),
                      width: getProportionateScreenHeight(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.kMainWhite,

                      ),
                      child: const Center(
                        child: Text('4'),
                      ),
                    ),
                  )


                ],
              ),
            ),
          )




        ],
      )),
    );
  }
}
