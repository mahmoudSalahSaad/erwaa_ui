

// ignore_for_file: constant_identifier_names

import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';


///
///

//month_picker_dialog 2.0.2
//awesome_dialog 3.1.0
//

///
///
class Constants {
  //static const String BASE_URL = "https://www.eldahan.com";
  static const String BASE_URL = "https://www.web-siting.com/mosques";
  static const String googleMapsAPIKey = 'AIzaSyDsG-7kR0VItPrGt8MCPLra255i_Bx1lvc';

  static get kMainWhite => const Color(0xffFFFFFF);

  static get kMainWhiteOb3 => const Color(0xffFFFFFF).withOpacity(0.4);

  static get kBgColor => const Color(0xffFFFFFF);

  static get kBgColorWithOP => const Color(0xffe8e8e8).withOpacity(0.5);

  static get kMainGray => const Color(0xffAAAAAA);
  static get kMainLightGray => const Color(0xffE8E8E8);

  static get kLightBlue => const Color(0xffCCF2F4);

  static get kLightSky => const Color(0xffA4EBF3);

  static get kRedishColor => const Color(0xffFE4D4D);


  static get kMainDarkBlue => const Color(0xff3D6FB7);
  static get kMainDarkBlueWithOP => const Color(0xff3D6FB7).withOpacity(0.15);
  static get kMainBlack => const  Color(0xff1E2929) ;



  static get kMainButtonColor => const LinearGradient(colors: [
    Color(0xffF9F5EF) ,
    Color(0xff383C4E)
  ],
  begin: Alignment.centerRight ,
  end: Alignment.centerLeft,
  tileMode: TileMode.decal
  ) ;
  static get kMainCardColor => const RadialGradient(colors: [
    Color(0xffF9F5EF) ,
    Color(0xffC5BAAA)
  ] ,
  focalRadius: 188 ,
  tileMode: TileMode.decal,

  ) ;


  static get homeHeader =>
      TextStyle(
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.bold,
        color: kMainWhite,
        fontFamily: "cairo",

      );

  // ignore: non_constant_identifier_names
  static get mainHeader =>
      TextStyle(
        fontSize: getProportionateScreenHeight(25),
        fontWeight: FontWeight.bold,
        color: kMainDarkBlue,
        fontFamily: "cairo",

      );

  //
  // static get mainProfileName =>
  //     TextStyle(
  //       fontSize: getProportionateScreenHeight(22),
  //       fontWeight: FontWeight.bold,
  //       color: kMainBlack,
  //       fontFamily: "cairo",
  //
  //     );


  //
  // static get mainProfileText =>
  //     TextStyle(
  //       fontSize: getProportionateScreenHeight(18),
  //       fontWeight: FontWeight.bold,
  //       color: kMainBlack,
  //       fontFamily: "cairo",
  //
  //     );
  static get mainAuthHeader =>
      TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.w500,
        color: kMainDarkBlue,
        fontFamily: "cairo",

      );


  static get checkOutHeader =>
      TextStyle(
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.bold,
        color: kMainDarkBlue,
        fontFamily: "cairo",


      );

  static get mainLightAuthHeader =>
      TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.w500,
        color: kMainWhite,
        fontFamily: "cairo",

      );

  static get authTextField =>
      TextStyle(
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.w500,
        color: kBgColor,
        fontFamily: "cairo",

      );



  static get mainAuthTextLabel =>
       TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "cairo",

      );


  static get smallAuthText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: "cairo",
      );
  static get errorText =>
      const TextStyle(
          color: Colors.red ,
          fontFamily: 'Cairo' ,
          fontSize: 12
      );



  static get smallHomeText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(12),
        fontWeight: FontWeight.bold,
        color: kMainWhite,
        fontFamily: "cairo",
      );


    static get ordersText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.bold,
        color: kMainWhite,
        fontFamily: "cairo",
      );




  static get backText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.bold,
        color: kMainWhite,
        fontFamily: "cairo",
      );



  static get smallDarkAuthText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.w500,
        color: kMainDarkBlue,
        fontFamily: "cairo",
      );
  static get smallDarkAuthCounterText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.bold,
        color: kMainDarkBlue,
        fontFamily: "cairo",
      );
  static get cardTitle =>
      TextStyle(
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.bold,
        color: kMainBlack,
        fontFamily: "cairo",
      );


  static get cardDescription =>
      TextStyle(
        fontSize: getProportionateScreenHeight(10),
        fontWeight: FontWeight.bold,
        color: kMainBlack,
        fontFamily: "cairo",
      );

  static get cardCostText =>
       TextStyle(
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.bold,
        color: Colors.red,
        fontFamily: "cairo",
      );


  static get cardCostDisText =>
       TextStyle(
        fontSize: getProportionateScreenHeight(12),
        fontWeight: FontWeight.bold,
        color: kMainGray,
        fontFamily: "cairo",
         decoration: TextDecoration.lineThrough,
      );




  static get descriptionAuthText =>
       TextStyle(
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.bold,
        color:Colors.black,
        fontFamily: "cairo",

      );


  static get dialogBtnText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(18),
        fontWeight: FontWeight.bold,
        color:Colors.black,
        fontFamily: "cairo",

      );



  static get homeMainText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.bold,
        color: kMainBlack,
        fontFamily: "cairo",
      );


  static get activeTimeLine =>
      TextStyle(
        fontSize: getProportionateScreenHeight(14),
        fontWeight: FontWeight.bold,
        color: kMainDarkBlue,
        fontFamily: "cairo",
      );



  static get descriptionAuthPinCodeText =>
       TextStyle(
        fontSize: getProportionateScreenHeight(18),
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "cairo",
      );



  static get pinCodeText =>
      TextStyle(
        fontSize: getProportionateScreenHeight(41),
        fontWeight: FontWeight.w500,
        color: kMainGray,
        fontFamily: "cairo",
      );
  static get mainProfileName => TextStyle(
    fontSize: getProportionateScreenHeight(24),
    fontWeight: FontWeight.bold,
    color: kMainBlack,
    fontFamily: "cairo",
  );
  /////// changed
  static get mainProfileNum => TextStyle(
    fontSize: getProportionateScreenHeight(20),
    fontWeight: FontWeight.w400,
    color: kMainBlack,
    fontFamily: "cairo",
  );
  /////// changed
  static get mainProfileText => TextStyle(
    fontSize: getProportionateScreenHeight(20),
    // fontWeight: FontWeight.bold,
    color: kMainWhite,
    fontFamily: "cairo",
  );
  /////// changed
  static get mainProfileversion => TextStyle(
    fontSize: getProportionateScreenHeight(18),
    fontWeight: FontWeight.bold,
    color: kMainBlack,
    fontFamily: "cairo",
  );




}