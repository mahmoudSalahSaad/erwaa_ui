import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/check_out/check_out_screen.dart';
import 'package:erwaa/views/home/home_screen.dart';
import 'package:erwaa/views/home/to_homes/to_home_screen.dart';
import 'package:erwaa/views/home/to_mosques/to_mosques_screen.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(
            isBack: false,
            title: "LOGO",
          ),

          SizedBox(
            height: getProportionateScreenHeight(16),
          ),



          const HomeSlider() ,

          SizedBox(
            height: getProportionateScreenHeight(20),
          ) ,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                HomeCard(title: "المساجد الأكثر احتياجا",path: "assets/images/icons8-mosque-96 (2).png" , onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
                }),
                HomeCard(title: "المساجد",path: "assets/images/icons8-mosque-96.png" , onPress: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> ToMosquesScreen()));},),

              ],
            ),
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ) ,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                HomeCard(title: "دور الأيتام",path: "assets/images/icons8-orphans-96.png" , onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ToHomeScreen()));
                }),
                HomeCard(title: "دور المسنين",path: "assets/images/icons8-elderly-96.png" , onPress: (){},),

              ],
            ),
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const ToHomeScreen())),
            child: Container(
              width: getProportionateScreenWidth(300),
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(16) , vertical: getProportionateScreenHeight(16)),
              decoration: BoxDecoration(
                  color: Constants.kMainWhite ,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1) ,
                        offset: const Offset(0, 0) ,
                        blurRadius: 58
                    )
                  ] ,
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(15))
              ),

              child: Directionality(
                textDirection: TextDirection.rtl,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/icons8-home-delivery-96.png" , height: getProportionateScreenHeight(78),scale: 1.2,) ,
                    Text("توصيل الي منازل" , style: Constants.homeMainText,)
                  ],
                ),
              ),
            ),
          ) ,

          SizedBox(
            height: getProportionateScreenHeight(16),
          ),



        ],
      ),
    );
  }
}



class CartCards extends StatelessWidget {
  const CartCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Container(
      width: getProportionateScreenWidth(320),
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset("assets/images/download.jpeg" , width: 80,) ,

            ],
          ) ,
          Column(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(180),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مياة ماركة افيان" , style: Constants.cardTitle,) ,

                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(4)),
                      decoration: const BoxDecoration(
                          color: Colors.red ,
                          shape: BoxShape.circle

                      ),
                      child: Center(
                        child: Image.asset("assets/icons/icons8-remove-96.png" , height: 20,),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(180),
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
                width: getProportionateScreenWidth(180),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                          decoration: BoxDecoration(
                            color: Constants.kMainDarkBlue ,
                            borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,

                          ),
                          child: Icon(Icons.add , color: Constants.kMainWhite,),
                        ) ,
                        SizedBox(
                          width: getProportionateScreenWidth(4),
                        ),
                        Text("10" , style: Constants.smallDarkAuthCounterText,) ,
                        SizedBox(
                          width: getProportionateScreenWidth(4),
                        ),
                        Container(
                          padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                          decoration: BoxDecoration(
                            color: Constants.kMainDarkBlue ,
                            borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,

                          ),
                          child: Icon(Icons.remove , color: Constants.kMainWhite,),
                        ) ,
                      ],
                    ),

                    Text("16.4 ر.س" ,style: Constants.cardCostText,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}




class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentPage =0 ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(140),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 3.0,
                enlargeCenterPage: true,

                onPageChanged: (index , _){
                  setState(() {
                    currentPage = index ;
                  });
                }

            ),
            items: List.generate(3, (index) =>
                Container(
                  decoration: BoxDecoration(
                    color: Constants.kMainWhite,

                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3) ,
                          blurRadius: 6 ,
                          offset: const Offset(0, 0)
                      )
                    ] ,
                    image: const DecorationImage(image: AssetImage("assets/images/19L-5-GALLON-MINERAL-WATER-DELIVERY-SERVICE-KUALA-LUMPUR-SELANGOR-300x300.png"),fit: BoxFit.cover)
                  ),
                ) ,

            ) ,
            // [

            //
            // ],


          ),
        ),
        DotsIndicator(
          dotsCount: 3,

          position: currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(28.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}



class HomeCard extends StatelessWidget {
  final String? path ;
  final String title ;
  final Function? onPress ;
  const HomeCard({Key? key, this.path, required this.title, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=> onPress!(),
      child: Container(
        height: getProportionateScreenHeight(140),
        width: getProportionateScreenWidth(140),
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Constants.kMainWhite ,
              Constants.kMainWhite ,
            ] ,
                tileMode: TileMode.decal ,
                begin: Alignment.topRight ,
                end: Alignment.bottomLeft
            ),

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("$path" , height: getProportionateScreenHeight(78),),
            Text(title, style: Constants.homeMainText,)
          ],
        ),
      ),
    );
  }
}


