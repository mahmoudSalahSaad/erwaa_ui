import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

// ignore: must_be_immutable
class ProfileCardwidget extends StatelessWidget {
  final String path;
  final String text;
  final Function onTap;
  double? iconHeight;
  ProfileCardwidget({
    super.key,
    this.iconHeight,
    required this.path,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(6)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Constants.kMainDarkBlue,
        ),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(333),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: getProportionateScreenWidth(8.3)),
            Image.asset(
              path,
              height: getProportionateScreenHeight(iconHeight ?? 30),
            ),
            SizedBox(
              width: getProportionateScreenWidth(5),
            ),
            Text(
              text,
              style: Constants.mainProfileText,
            )
          ],
        ),
      ),
    );
  }
}
