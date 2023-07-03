import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';


class MyAddressBody extends StatefulWidget {
  const MyAddressBody({Key? key}) : super(key: key);

  @override
  State<MyAddressBody> createState() => _MyAddressBodyState();
}

class _MyAddressBodyState extends State<MyAddressBody> {

  //{lat: 30.0782365, lng: 31.3358343}



  getLocation()async{

    final coordinates = Coordinates(30.0782365, 31.3358343);
    var  addresses = await Geocoder.google("AIzaSyDsG-7kR0VItPrGt8MCPLra255i_Bx1lvc" , language: "ar").findAddressesFromCoordinates(coordinates);


  }
  @override
  Widget build(BuildContext context) {
    getLocation();
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(
             onPress: ()=> Navigator.pop(context),
            title: "العناوين",
            isBack: true,
          ) ,
          SizedBox(
            height: getProportionateScreenHeight(20),

          ) ,


            Column(
              children: List.generate(5, (index) => Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                  color: Constants.kMainWhite ,
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)) ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const  Offset(0, 0) ,
                      blurRadius: 58
                    )
                  ]
                ),
              )),
            ),

        ],
      ),
    );
  }
}
