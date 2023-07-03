import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/main_pass_field_widget.dart';

class PassChangeBody extends StatefulWidget {
  const PassChangeBody({super.key});

  @override
  State<PassChangeBody> createState() => _PassChangeBodyState();
}

class _PassChangeBodyState extends State<PassChangeBody> {
  final _formKey = GlobalKey<FormState>();
  String currentPass = '';
  String? newPass;
  String confirmPass = '';
  onvalidate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /////////////// Header ////////////
          Header(
            isBack: true,
            title: "تغيير كلمة المرور",
            onPress: () => Navigator.of(context).pop(),
          ),
          /////////////// Main Content ////////////
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14),
                vertical: getProportionateScreenHeight(17)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "تغيير كلمة المرور",
                        style: Constants.mainHeader,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  ////////////// First Field

                  Text(
                    "كلمة المرور الحالية",
                    style: Constants.mainAuthTextLabel,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  PassFieldWidget(
                    obscure: true,
                    width: getProportionateScreenWidth(320),
                    onChange: (v1) {},
                    onSave: (v) {},
                    onValidate: (v) {
                      if (v != currentPass) {
                        return 'كلمة المرور غير صحيحة';
                      }
                    },
                  ),

                  ////////////// Second Field

                  Text(
                    "كلمة المرور الجديدة",
                    style: Constants.mainAuthTextLabel,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  PassFieldWidget(
                    obscure: true,
                    width: getProportionateScreenWidth(320),
                    onChange: (v) {},
                    onSave: (v) {},
                    onValidate: (v) {
                      setState(() {
                        newPass = v;
                      });

                      if (v == null || v.trim().length < 6) {
                        return 'كلمة المرور يجب ان لا تقل عن 6 احرف';
                      }
                    },
                  ),

                  ////////////// Third Field

                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  Text("تاكيد كلمة المرور الجديدة",
                      style: Constants.mainAuthTextLabel),
                  SizedBox(height: getProportionateScreenHeight(6)),
                  PassFieldWidget(
                    obscure: true,
                    width: getProportionateScreenWidth(320),
                    onChange: (p0) {
                      p0 = confirmPass;
                    },
                    onSave: (p0) {},
                    onValidate: (p0) {
                      if (p0 != newPass) {
                        return 'كلمة المرور غير متطابقة';
                      }
                    },
                  ),

                  ////////////// Button
                  SizedBox(height: getProportionateScreenHeight(40)),
                  GestureDetector(
                    onTap: () {
                      onvalidate();
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                      width: getProportionateScreenWidth(318),
                      decoration: BoxDecoration(
                          gradient: RadialGradient(
                              colors: [
                                Constants.kMainDarkBlue,
                                Constants.kMainGray
                              ],
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
