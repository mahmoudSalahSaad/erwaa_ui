import 'package:erwaa/views/auth/reset_password_screen/reset_password_body/reset_password_body.dart';
import 'package:flutter/material.dart';



class ResetPasswordScreen extends StatelessWidget {
  final String? token ;
  const ResetPasswordScreen({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ResetBody(
          token: token,
        ),
      ),
    );
  }
}
