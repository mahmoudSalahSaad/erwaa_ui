import 'dart:async';

import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/widgets/main_text_field.dart';
import 'package:erwaa/views/cart/add_to_card.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



class ToMosquesBody extends StatefulWidget {
  const ToMosquesBody({Key? key}) : super(key: key);

  @override
  State<ToMosquesBody> createState() => _ToMosquesBodyState();
}

class _ToMosquesBodyState extends State<ToMosquesBody> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();




  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;


  List<Marker> markers =  [] ;

  // void showPlacePicker() async {
  //   LocationResult? result = await Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => PlacePicker(Constants.googleMapsAPIKey)));
  //
  //   // Handle the result in your way
  //   print(result);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1) , ()async{
      try{

        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }

        _locationData = await location.getLocation();
        // print("DOne000000000000000000000000000");
        // print(_locationData.latitude);
        // print(_locationData.longitude);
        _kGooglePlex = CameraPosition(
          target: LatLng(_locationData.latitude! ,  _locationData.longitude!),
          zoom: 19,
        );
        final GoogleMapController controller = await _controller.future;
        await controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));


        setState(() {
          markers.add(Marker(
              markerId:  const MarkerId("userId") ,
              position: LatLng(_locationData.latitude!, _locationData.longitude!) ,
              icon: BitmapDescriptor.defaultMarker ,
            onTap: (){
                showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      maxWidth: getProportionateScreenWidth(350) ,
                      minWidth: getProportionateScreenWidth(300)
                    ),
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getProportionateScreenHeight(15)) ,
                        topRight: Radius.circular(getProportionateScreenHeight(15))
                      )
                    ),
                    builder: (_){
                  return Container(
                    height: getProportionateScreenHeight(600),
                    padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2 ,
                            mainAxisSpacing: 10 , 
                          crossAxisSpacing: 10 , 
                          childAspectRatio: 0.6
                        ),
                        itemCount: 6,
                        itemBuilder: (_ , index){
                          return  GestureDetector(
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
                          ) ;
                        }),
                  );
                }) ;
            }
          ));
        });
        // mapController.addMarker(MarkerOptions(
        //   position: mapController.cameraPosition.target,
        //   icon: BitmapDescriptor.fromAsset('images/circle.png',),
        // ),
        // );
      } catch(e){
        if(kDebugMode){
          print(e);
        }
      }
    });
  }


    CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          trafficEnabled: false,
          mapToolbarEnabled: false,
          markers: Set.of(markers),

          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);

          },

        ) ,

        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child:Directionality(
              textDirection: TextDirection.rtl,
              child:  SizedBox(
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20) ,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                              decoration: BoxDecoration(
                                  color: Constants.kMainWhite ,
                                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1) ,
                                        offset: const Offset(0, 0) ,
                                        blurRadius: 58
                                    )
                                  ]
                              ),
                              child: Center(
                                child:  Directionality(textDirection: TextDirection.ltr, child: Icon(Icons.arrow_forward_ios_outlined , color: Constants.kMainBlack, )),
                              ),
                            ),
                          ) ,
                          MainTextField(
                            hint: "البحث عن مساجد",
                            width:getProportionateScreenWidth(280),

                          ),
                          
                          

                        ],
                      ),
                    ) , 
                    SizedBox(
                      height: getProportionateScreenHeight(16),
                    ) , 
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                      child: GestureDetector(
                        onTap: ()async {
                          final GoogleMapController controller = await _controller.future;
                          await controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10 , horizontal: getProportionateScreenWidth(30)),
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
                              Image.asset("assets/icons/icons8-my-location-96.png"  , height: 28,)
                            ],
                          ),
                        ),
                      ),
                    ) ,
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    const ImageTextMap(
                      width: 22,
                    ) ,
                    const ImageTextMap(
                      text: "المساجد الاكثر أحتياجا",
                      path: "assets/images/icons8-mosque-96 (2).png",
                      width: 4,
                    ) ,
                    const ImageTextMap(
                      text: "دار الأيتام",
                      path: "assets/images/icons8-orphans-96.png",
                      width: 22,
                    ) ,
                    const ImageTextMap(
                      text: "دار المسنين",
                      path: "assets/images/icons8-elderly-96.png",
                      width: 22,
                    ) ,




                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ImageTextMap extends StatelessWidget {
  final String? path ;
  final String ? text ;
  final double ? width ;
  const ImageTextMap({
    super.key, this.path, this.text, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Container(
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
        padding: EdgeInsets.symmetric(vertical:  getProportionateScreenHeight(10) , horizontal: getProportionateScreenWidth(width??20)),
        decoration: BoxDecoration(
          color: Constants.kMainWhite ,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1) ,
              blurRadius: 58 ,
              offset: const Offset(0, 0)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(path??"assets/images/icons8-mosque-96.png" , height: getProportionateScreenHeight(48),) ,
            SizedBox(
              height: getProportionateScreenHeight(6)
            ) ,
            Text(text??"المساجد" , style: Constants.cardDescription,),
          ],
        ),
      ),
    );
  }
}
