import 'package:erwaa/views/check_out/check_out_body/check_out_body.dart';
import 'package:flutter/material.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CheckOutBody(),
      ),
    );
  }
}
