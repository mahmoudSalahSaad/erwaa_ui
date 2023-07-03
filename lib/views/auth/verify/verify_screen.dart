import 'package:erwaa/views/auth/verify/body/verify_body.dart';
import 'package:flutter/material.dart';


class VerifyScreen extends StatelessWidget {
  final  String? type ;
  final  String? mobile ;
  final  String? code ;
  const VerifyScreen({Key? key, this.type, this.mobile, this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:VerifyBody(
          code: code,
          type: type,
          mobile: mobile,
        ),
      ),
    );
  }
}
