import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/home/body/home_body.dart';
import 'package:erwaa/views/profile/change_profile/widgets/header.dart';
// import 'package:erwaa/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(
          title: "طلباتي",
          isBack: false,
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SizedBox(
            height: getProportionateScreenHeight(50),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return Container(
                      margin:
                          EdgeInsets.only(left: getProportionateScreenWidth(5)),
                      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                      decoration: BoxDecoration(
                          color: index == 1
                              ? Constants.kMainDarkBlue
                              : Constants.kMainWhite,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(8)),
                          border: Border.all(color: Constants.kMainDarkBlue)),
                      child: Center(
                        child: Text(
                          "قيد التجهيز",
                          style: index == 1
                              ? Constants.mainLightAuthHeader
                              : Constants.mainAuthHeader,
                        ),
                      ),
                    );
                  }),
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
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                    color: Constants.kMainWhite,
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenHeight(8)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 58,
                          offset: const Offset(0, 0))
                    ]),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "طلبك رقثم #123456",
                              style: Constants.mainAuthHeader,
                            ),
                            Text(
                              "48 ر.س",
                              style: Constants.mainAuthTextLabel,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4 منتج -استلام من المنزل",
                              style: Constants.cardDescription,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "بتاريخ ",
                                  style: Constants.cardDescription,
                                ),
                                Text(
                                  "29-5-2023",
                                  style: Constants.mainAuthHeader,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(30),
                                  vertical: getProportionateScreenHeight(8)),
                              decoration: BoxDecoration(
                                color: Constants.kMainDarkBlue,
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(8)),
                              ),
                              child: Center(
                                child: Text(
                                  "تفصيل الطلب",
                                  style: Constants.smallHomeText,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(30),
                                  vertical: getProportionateScreenHeight(8)),
                              decoration: BoxDecoration(
                                color: Constants.kMainDarkBlue,
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(8)),
                              ),
                              child: Center(
                                child: Text(
                                  "اعادة الطلب",
                                  style: Constants.smallHomeText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}
