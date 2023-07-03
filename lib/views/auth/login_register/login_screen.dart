import 'package:erwaa/utils/size_config.dart';
import 'package:erwaa/views/auth/login_register/body/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(

      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LoginBody(),
      ),
    );
  }
}




