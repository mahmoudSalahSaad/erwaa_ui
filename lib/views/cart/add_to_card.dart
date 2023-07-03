import 'package:erwaa/contorller/cart_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    final cartProvider = Provider.of<CartProvider>(context , listen: false);

    cartProvider.setItemPrice = 1.64 ;
    cartProvider.setItemQty = 10 ;
    cartProvider.setTotalPrice = cartProvider.itemPrice * cartProvider.itemQty;
  }







  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context , listen: true);


    return
      Directionality(textDirection: TextDirection.rtl, child: Container(
        height: getProportionateScreenHeight(205),
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/download.jpeg" , width: getProportionateScreenWidth(80),) ,
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(220),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("مياة ماركة افيان" , style: Constants.cardTitle,) ,

                          GestureDetector(
                            onTap: ()=> Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(getProportionateScreenHeight(4)),
                              decoration: const BoxDecoration(
                                  color: Colors.red ,
                                  shape: BoxShape.circle

                              ),
                              child: Center(
                                child: Icon(Icons.close , color: Constants.kMainWhite,),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(220),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("(كرتون-40 قارورة)" , style: Constants.cardDescription,) ,

                          Container(

                            decoration: const BoxDecoration(
                                color: Colors.red ,
                                shape: BoxShape.circle

                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(4),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(220),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  print("clicked!");
                                  cartProvider.addQty();
                                },
                                child:Container(
                                  padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                                  decoration: BoxDecoration(
                                    color: Constants.kMainDarkBlue ,
                                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,

                                  ),
                                  child: Icon(Icons.add , color: Constants.kMainWhite,),
                                ) ,
                              ) ,
                              SizedBox(
                                width: getProportionateScreenWidth(4),
                              ),
                              Text("${cartProvider.itemQty}" , style: Constants.smallDarkAuthCounterText,) ,
                              SizedBox(
                                width: getProportionateScreenWidth(4),
                              ),
                              GestureDetector(
                                onTap: (){
                                  cartProvider.removeQty(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                                  decoration: BoxDecoration(
                                    color: Constants.kMainDarkBlue ,
                                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,

                                  ),
                                  child: Icon(Icons.remove , color: Constants.kMainWhite,),
                                ) ,
                              ),
                            ],
                          ),

                          Text("${cartProvider.totalPrice.toStringAsFixed(1)} ر.س" ,style: Constants.cardCostText,)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ) ,
            SizedBox(
              height: getProportionateScreenHeight(10),
            ) ,
            Container(
              width: getProportionateScreenWidth(330),
              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
              decoration: BoxDecoration(
                color: Constants.kMainDarkBlue ,
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,

              ),
              child: Center(
                child: Text("اضف الي العربة"  , style: Constants.mainLightAuthHeader,),
              ),
            )
          ],
        ),
      ));
  }
}
