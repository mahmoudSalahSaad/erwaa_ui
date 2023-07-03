import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/my_orders/my_orders_screen.dart';
import 'package:erwaa/views/profile/profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child: HomeBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 0),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  final int? selectedIndex ;
  const CustomNavigationBar({Key? key, this.selectedIndex}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int? _selectedIndex ;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;


       if(_selectedIndex == 0){


         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const HomeScreen()) , (route)=> false);
       }else if(_selectedIndex == 1){
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const myOrdersScreen()) , (route)=> false);
       }else if(_selectedIndex == 2){
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const ProfileScreen()), (route) => false);
       }




    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.selectedIndex! ;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 58,
                offset: const Offset(0, 0))
          ]),
          child: ResponsiveNavigationBar(
            selectedIndex: _selectedIndex??0,
            onTabChange: (value) => changeTab(value),
            backgroundColor: Constants.kMainWhite,
            inactiveIconColor: Constants.kMainDarkBlue,
            fontSize: 14,


            activeButtonFlexFactor: 80,

            backgroundBlur: 0,
            outerPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            borderRadius: 12,

            // showActiveButtonText: false,
            textStyle: const TextStyle(
              color: Colors.white,
              fontFamily: "Cairo",
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            navigationBarButtons: <NavigationBarButton>[
              NavigationBarButton(
                text: 'الرئيسية',

                icon:  SizedBox(
                  height: getProportionateScreenHeight(30),
                  child: _selectedIndex == 0
                      ? Image.asset("assets/icons/icons8-home-48.png")
                      : Image.asset("assets/icons/icons8-home-96.png"),
                ),
                backgroundColor: Constants.kMainDarkBlue,
              ),
              NavigationBarButton(
                text: 'طلباتي',
                icon: SizedBox(
                  height: getProportionateScreenHeight(30),
                  child: _selectedIndex == 1
                      ? Image.asset("assets/icons/icons8-ordering-96.png")
                      : Image.asset(
                      "assets/icons/icons8-ordering-96 (1).png"),
                ),
                backgroundColor: Constants.kMainDarkBlue,
              ),
              NavigationBarButton(
                text: 'المزيد',
                icon: SizedBox(
                  height: getProportionateScreenHeight(30),
                  child: _selectedIndex == 2
                      ? Image.asset("assets/icons/icons8-menu-48 (1).png")
                      : Image.asset("assets/icons/icons8-menu-48.png"),
                ),
                backgroundColor: Constants.kMainDarkBlue,
              ),
            ],
          ),
        ));
  }
}

