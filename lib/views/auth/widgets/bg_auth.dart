import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';

class BgAuth extends StatelessWidget {
  final double? height ;
  const BgAuth({
    super.key, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! *0.96,
      child: Stack(
        children: [

          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/19L-5-GALLON-MINERAL-WATER-DELIVERY-SERVICE-KUALA-LUMPUR-SELANGOR-300x300.png"),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: height??getProportionateScreenHeight(700),
                width: SizeConfig.screenWidth,
                child: Image.asset(
                  "assets/images/Untitled-2.png",
                  fit: BoxFit.fill,
                  height: getProportionateScreenHeight(400),
                )),
          )
        ],
      ),
    );
  }
}