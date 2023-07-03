import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final String title;
  final bool? isBack;
  final Function? onPress;

  const Header({
    super.key,
    required this.title,
    this.isBack,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(64),
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          color: Constants.kMainDarkBlue,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(getProportionateScreenHeight(10)),
              bottomLeft: Radius.circular(getProportionateScreenHeight(10)))),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBack!
                  ? GestureDetector(
                      onTap: () => onPress!(),
                      child: const Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                            size: 30,
                          )),
                    )
                  : SizedBox(
                      width: getProportionateScreenWidth(040),
                    ),
              Text(
                title,
                style: Constants.homeHeader,
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
              )
            ],
          )),
    );
  }
}
