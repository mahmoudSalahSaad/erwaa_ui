import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/address/my_addressess/my_addresses_screen.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/change_profile_screen.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
import 'package:erwaa/views/profile/pass_change/pass_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_card_widget.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context , listen: false) ;
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end
        children: [
          /////////////////Header //////////////////////////////////
          HomeHeader(
            isBack: false,
            title: "الملف الشخصي",
            onPress: () {},
          ),
          SizedBox(
////////////////// Specified Height for scrollView ///////////////////////////////////
            height: getProportionateScreenHeight(645),
////////////////// Specified Height for scrollView ///////////////////////////////////
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /////////////////////////////////////// Main Content //////////////
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(11),
                        vertical: getProportionateScreenHeight(12)),
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(9),
                        horizontal: getProportionateScreenWidth(37)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 58,
                              color: Colors.black.withOpacity(0.16))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${userProvider.user!.firstName} ${userProvider.user!.lastName}",
                              style: Constants.mainProfileName,
                            ),
                            Text(
                              "${userProvider.user!.code} ${userProvider.user!.mobile}",
                              style: Constants.mainProfileNum,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(9),
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                ProfileCardwidget(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                        const ProfileChangeScreen()));
                                  },
                                  path: "assets/icons/icons8-edit-profile-96 (1).png",
                                  text: "تعديل الملف الشخصي",
                                ),
                                ProfileCardwidget(
                                  text: "تغير كلمة المرور",
                                  path:
                                  "assets/icons/icons8-change-password-96 (1).png",
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                          const PassChangeScreen())),
                                ),
                                ProfileCardwidget(
                                  onTap: () {},
                                  path: "assets/icons/icons8-card-payment-96.png",
                                  text: "طلباتي",
                                ),
                                ProfileCardwidget(
                                  onTap: () {},
                                  iconHeight: 26,
                                  path: "assets/icons/icons8-locked-file-96.png",
                                  text: "الطلبات المجدولة",
                                ),
                                ProfileCardwidget(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                          const MyAddressScreen())),
                                  path: "assets/icons/icons8-location-96.png",
                                  text: "العناوين",
                                ),
                                ProfileCardwidget(
                                  onTap: () {},
                                  iconHeight: 28,
                                  path: "assets/icons/icons8-privacy-96 (1).png",
                                  text: "الخصوصية",
                                ),
                                ProfileCardwidget(
                                  onTap: () {},
                                  iconHeight: 28,
                                  path: "assets/icons/icons8-about-us-96 (1).png",
                                  text: "ملعومات عنا",
                                ),
                              ],
                            )),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        Column(
                          children: [
                            Text("تابعنا على",
                                style: Constants.mainProfileversion),
                            SizedBox(height: getProportionateScreenHeight(13)),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/icons/icons8-web-96.png",
                                      height: 28),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Image.asset(
                                    "assets/icons/icons8-twitter-96.png",
                                    height: 26,
                                  ),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Image.asset(
                                      "assets/icons/icons8-instagram-96.png",
                                      height: 35),
                                ],
                              ),
                            ),
                            Text(
                              "v 0.0.1",
                              style: Constants.mainProfileversion,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  //////////////Bottom Buttons of signout and delete /////////////////////
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: getProportionateScreenHeight(60),
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(15),
                                vertical: getProportionateScreenHeight(8)),
                            decoration: BoxDecoration(
                              color: Constants.kMainDarkBlue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Constants.kMainWhite,
                                  radius: 23,
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/icons8-power-67.png",
                                        height: 35),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(5),
                                ),
                                Text(
                                  "تسجيل الخروج",
                                  style: Constants.backText,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(60),
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(15),
                                vertical: getProportionateScreenHeight(8)),
                            decoration: BoxDecoration(
                              color: Constants.kRedishColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/icons8-denied-96.png",
                                  height: 42,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Text(
                                  "حذف الحساب",
                                  style: Constants.backText,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
