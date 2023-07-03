import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/cart/add_to_card.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';

class ToHomeBody extends StatefulWidget {
  const ToHomeBody({Key? key}) : super(key: key);

  @override
  State<ToHomeBody> createState() => _ToHomeBodyState();
}

class _ToHomeBodyState extends State<ToHomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(

        width: SizeConfig.screenWidth,
        child: Column(
        children: [
           HomeHeader(
            isBack: true,
            title: "توصيل الي المنازل",
            onPress: ()=> Navigator.pop(context),
          ),


          const HomeSlider() ,
          Column(
            children: [
              GridView.builder(

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 ,
                      childAspectRatio: 0.61 ,
                      crossAxisSpacing: 10 ,

                      mainAxisSpacing: 10
                  ),
                  shrinkWrap: true,
                  itemCount: 6,
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(16) ,
                      right: getProportionateScreenWidth(16) ,
                      bottom: getProportionateScreenHeight(10) ,
                      top: getProportionateScreenHeight(10)
                  ),
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (_ , index){
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context,
                                backgroundColor: Constants.kMainWhite,
                                isDismissible: true,
                                elevation: 1,
                                constraints: BoxConstraints(
                                  maxWidth: getProportionateScreenWidth(350) ,
                                  minWidth: getProportionateScreenWidth(300)
                                ),

                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15) , topLeft: Radius.circular(15)) , 
                                  
                                ),
                                builder: (_){
                              return const AddToCard();
                            }) ;
                          },
                          child: Container(
                            width: getProportionateScreenWidth(176),
                            decoration: BoxDecoration(
                                color: Constants.kMainWhite ,
                                borderRadius: BorderRadius.circular(8) ,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1) ,
                                      offset: const Offset(0, 0) ,
                                      blurRadius: 6
                                  )
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 130,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/images/download.jpeg"))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding : EdgeInsets.all(getProportionateScreenHeight(6)),
                                            decoration:const BoxDecoration(
                                              color: Colors.red ,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(8)) ,

                                            ),
                                            child: Center(
                                              child: Text("خصم 1.6 ر.س",style: Constants.smallHomeText,),
                                            ),
                                          )
                                        ],
                                      ) ,

                                    ],
                                  ),
                                ) ,
                                // Image.asset("assets/images/download.jpeg" , width: 120,) ,
                                Text("مياة ماركت افيان" ,style: Constants.cardTitle,),
                                Text("(كرتون-40 قارورة)" ,style: Constants.cardDescription,),
                                Directionality(textDirection: TextDirection.rtl, child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("16.4 ر.س" , style: Constants.cardCostText,) ,
                                      Text("18.0 ر.س" , style: Constants.cardCostDisText) ,
                                    ],
                                  ),
                                )) ,


                                Container(
                                  width: getProportionateScreenWidth(100),
                                  padding :EdgeInsets.symmetric(vertical: getProportionateScreenHeight(6)) ,
                                  decoration: BoxDecoration(
                                    color:  Constants.kMainDarkBlue ,
                                    borderRadius: BorderRadius.circular(8) ,

                                  ),
                                  child: Center(
                                    child: Text("اضف" ,style: Constants.smallHomeText,),
                                  ),
                                ) ,

                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                )

                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  })
            ],
          )
        ],
        ),

      ),
    );
  }
}
