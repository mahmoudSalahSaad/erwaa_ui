import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/widgets/main_text_field.dart';
import 'package:erwaa/views/profile/pass_change/widgets/header.dart';
import 'package:flutter/material.dart';


import '../widgets/main_phone_text_field.dart';

// import '../widgets/header.dart';
// import '../widgets/main_pass_field_widget.dart';

class ProfilechangeBody extends StatefulWidget {
  const ProfilechangeBody({super.key});

  @override
  State<ProfilechangeBody> createState() => _ProfilechangeBodyState();
}

class _ProfilechangeBodyState extends State<ProfilechangeBody> {
  final _formKey = GlobalKey<FormState>();
  String currentFirstName = 'محمود';
  String currentFamilyName = 'صلاح';
  String currentNumb = '12345678';
  onvalidate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          /////////////// Header ////////////
          Header(
              isBack: true,
              title: "تعديل الملف الشخصي",
              onPress: () => Navigator.of(context).pop()),
          /////////////// Main Content ////////////
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14),
                vertical: getProportionateScreenHeight(17)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                /////// Main component //////////
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "تعديل الملف الشخصي",
                      style: Constants.mainHeader,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "أٍسم العائلة",
                          style: Constants.mainAuthTextLabel,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4),
                        ),
                        MainTextField(
                          onValidate: (p0) {},
                          onSave: (p0) {},
                          hint: currentFamilyName,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "الاسم الأول",
                          style: Constants.mainAuthTextLabel,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4),
                        ),
                        MainTextField(
                          onValidate: (p0) {},
                          onSave: (p0) {},
                          hint: currentFirstName,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "رقم الجوال",
                      style: Constants.mainAuthTextLabel,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4),
                ),
                MainPhoneTextFieldUpdated(phoneNumb: currentNumb),
              ],
            )),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          GestureDetector(
            onTap: () {
              onvalidate();
            },
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
              width: getProportionateScreenWidth(295),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Constants.kMainDarkBlue, Constants.kMainGray],
                      tileMode: TileMode.decal,
                      focalRadius: 200,
                      radius: 100),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "تغيير",
                  style: Constants.mainLightAuthHeader,
                ),
              ),
            ),
          ),
        ]));
  }
}
