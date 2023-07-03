import 'package:erwaa/views/auth/forget%20password/forget_password_body/forget_password_body.dart';
import 'package:flutter/material.dart';



class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ForgetBody(),
      ),

    );
  }
}
