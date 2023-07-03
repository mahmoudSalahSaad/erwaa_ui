import 'package:erwaa/contorller/my_oreders_ui_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:erwaa/views/my_orders/orders_details/orders_details_screen.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {

  final List<Map<String , dynamic>> orderFilters = [
    {
      'name' : "الكل",
      'state' : true
    },
    {
      'name' : "معلق",
      'state' : false
    },
    {
      'name' : "قيد التجهيز",
      'state' : false
    },
    {
      'name' : "قيد التوصيل",
      'state' : false
    },
    {
      'name' : "تم التوصيل",
      'state' : false
    }
  ] ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final myOrdersUiProvider = Provider.of<MyOrdersUiProvider>(context , listen: true) ;
    return Column(
      children: [
       const  HomeHeader(
          title: "طلباتي",
          isBack: false,

        ) ,
        SizedBox(
          height: getProportionateScreenHeight(10),
        ) ,

        Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)) ,
        child: SizedBox(
          height: getProportionateScreenHeight(50),
          child:Directionality(textDirection: TextDirection.rtl,
              child:  ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(orderFilters.length, (index) {
              return GestureDetector(
                onTap: (){
                  myOrdersUiProvider.chnageOrdersState(ordersFilters: orderFilters , index: index);
                },
                child: Container(
                  margin: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                  padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                  decoration: BoxDecoration(
                      color: orderFilters[index]['state']  ? Constants.kMainDarkBlue : Constants.kMainWhite ,
                      borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,
                      border: Border.all(color: Constants.kMainDarkBlue)
                  ),
                  child: Center(
                    child: Text("${orderFilters[index]['name']}",style: orderFilters[index]['state']  ? Constants.mainLightAuthHeader : Constants.mainAuthHeader,),
                  ) ,

                ),
              );
            }
            ),
          )),
        ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            // padding: EdgeInsets.only(bottom: getProportionateScreenHeight(120)),
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            shrinkWrap: true,
            itemBuilder: (_ ,index){
              return Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                    color: Constants.kMainWhite ,
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1) ,
                          blurRadius: 58 ,
                          offset: const Offset(0, 0)
                      )
                    ]
                ),
                child: Directionality(textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("طلبك رقثم #123456" ,style: Constants.mainAuthHeader,) ,
                            Text("48 ر.س" , style: Constants.mainAuthTextLabel,) ,

                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("4 منتج -استلام من المنزل" ,style: Constants.cardDescription,) ,


                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("بتاريخ " ,style: Constants.cardDescription,) ,
                                Text("29-5-2023" ,style: Constants.mainAuthHeader,) ,
                              ],
                            )


                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>const OrderDetails())),
                              child:  Container(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30) ,vertical: getProportionateScreenHeight(8)),
                                decoration: BoxDecoration(
                                  color: Constants.kMainDarkBlue ,
                                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                                ),
                                child: Center(
                                  child: Text("تفصيل الطلب", style: Constants.ordersText,),

                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ) ,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30) ,vertical: getProportionateScreenHeight(8)),
                              decoration: BoxDecoration(
                                color: Colors.red ,
                                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                              ),
                              child: Center(
                                 child: Text("اعادة الطلب", style: Constants.ordersText,),

                              ),
                            ),


                          ],
                        ),


                      ],
                    )),
              ) ;
            },
          ),
        )
      ],
    ) ;
  }
}
